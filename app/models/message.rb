class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id, :type => Integer  
  field :content
  field :location
  field :label
end