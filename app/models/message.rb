class Message
  include Mongoid::Document
  
  field :user_id, :type => Integer  
  field :content
  field :created_at, :type => Date
  field :location
  field :label
end