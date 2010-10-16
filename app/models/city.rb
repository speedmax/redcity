class City
  include Mongoid::Document

  field :name
  field :location
  
  referenced_in :country
  references_many :followers, :stored_as => :array, :inverse_of => :followings, :class_name => 'Profile'
end
