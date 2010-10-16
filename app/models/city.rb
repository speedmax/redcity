class City
  include Mongoid::Document
  
  referenced_in :country
  
  field :name
  field :country_id
  field :location
  field :follower_ids
  
  
end
