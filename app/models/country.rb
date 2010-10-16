class Country
  include Mongoid::Document
  
  field :name
  field :code
  field :locale
  
  references_many :cities, :dependent => :destroy
  
  
end
