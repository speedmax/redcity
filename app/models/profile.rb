class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  # Attributes
  field :name
  field :type
  field :email
  field :interests, :type => Array
  field :setup,     :type => Boolean
  field :remember_token
  field :location,  :type => Array
  field :location_string
  field :about
  slug  :name

  index [[ :location, Mongo::GEO2D ]]

  # Associations
  embeds_one :address
  embeds_one :login_account, :class_name => 'Omnisocial::LoginAccount'
  delegate :login, :name, :picture_url, :account_url, :to => :login_account

  referenced_in :city
  referenced_in :country
  
  references_many :followings, :stored_as => :array, :inverse_of => :followers, :class_name => 'Profile'
  references_many :followers, :stored_as => :array, :inverse_of => :followings, :class_name => 'Profile'
  
  references_many :following_cities, :stored_as => :array, :inverse_of => :followers, :class_name => 'City'
  references_many :messages, :dependent => :destroy

  # Validations
  validates_associated :city
  validates_presence_of :name
  
  # Location aware
  
  def location=(location)
    if location.is_a?(Array)
      return self[:location] = location
    end
    
    if location.match /(-?\d+\.\d+,\s?-?\d+\.\d+)/
      location = $1
    end

    if result = Geocode.find(location)
      self[:location] = result.coordinates
      self.location_string = "#{result.locality}, #{}"
    end
  end
  
  def closest_city
    city = nil
    
    BSON::OrderedHash.new.tap do |query| 
      query["geoNear"] = "cities" 
      query["near"] = Profile.first.location  # lat / long 
      query["num"] = 2          # max results 

      result = City.collection.db.command(query) 

      if result["results"]
        city = City.find(result["results"][0]["obj"]["_id"])
      end
    end
    
    city
  end
  
  # Friendships
  def followed?(user)
    following_ids && following_ids.include?(user.id)
  end
  
  def follow(user)
    self.followings << user
  end
  
  def unfollow(user)
    if followed?(user)
      self.following_ids = following_ids - [user.id]
      user.follower_ids = follower_ids - [self.id]
      self.save
      user.save
    end
  end
  
  def interests_list 
    interests.join(', ') if interests
  end
  
  def interests=(string)
    self[:interests] = string.split(',').map(&:strip).compact
  end
  
  # Account methods
  def from_twitter?
    login_account.kind_of? TwitterAccount
  end

  def from_facebook?
    login_account.kind_of? FacebookAccount
  end

  def remember
    unless new_record?
      token = "#{Time.now}-#{self.login_account.class.to_s}-#{self.login}"
      update_attributes(:remember_token => ::BCrypt::Password.create(token))
    end
  end

  def forget
    update_attributes(:remember_token => nil) unless new_record?
  end
  
end
