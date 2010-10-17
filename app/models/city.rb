class City
  include Mongoid::Document

  field :name
  field :region
  field :location,    :type => Array
  field :area,        :type => Array
  
  field :users_count, :type => Integer, :default => 0
  field :slug
  
  index :users_count
  index [[ :location, Mongo::GEO2D ]]
  
  referenced_in :country
  references_many :followers, :stored_as => :array, :inverse_of => :followings, :class_name => 'Profile'
  references_many :users, :class_name => 'Profile', :inverse_of => :city, :foreign_key => :city_id

  before_save :generate_slug
  
  def generate_slug
    self.slug = self.name.parameterize
  end
  
  def to_param
    self.slug
  end
end
