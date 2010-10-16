class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  referenced_in :profile

  field :content
  field :location
  field :label
end