class Message
  LABELS = %w(Job Share News Question Event Meetup Drink)
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content
  field :location, :type => Array
  field :label
  field :replies_count, :type => Integer, :default => 0
  
  index [[ :location, Mongo::GEO2D ]]

  # Associations
  referenced_in :profile
  referenced_in :city
  
  # Embeds_many doesn't work for exiting record, soon to be fixed in mongoid repos
  referenced_in :reply_to, :class_name => self.name, :inverse_of => :replies, :index => true
  references_many :replies, :class_name => self.name, :foreign_key => :reply_to_id, :inverse_of => :reply_to
  scope :active, where(:reply_to_id => nil)
  
  # Validation
  validates_presence_of :content
  
  before_save :save_counter

  def location=(location)
    if location.is_a?(Array)
      return self[:location] = location
    end
    
    if location.match /(-?\d+\.\d+,\s?-?\d+\.\d+)/
      location = $1
    end

    if loc = Geolocation.find(location)
      self[:location] = loc.coordinates
    end
  end

  private
    def save_counter
      self.replies_count = replies.count
    end
end