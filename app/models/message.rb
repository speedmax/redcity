class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content
  field :location
  field :label

  referenced_in :profile
  referenced_in :reply_to, :class_name => 'Message'
  references_many :replies, :stored_as => :array, :inverse_of => :reply, :class_name => 'Message'
end