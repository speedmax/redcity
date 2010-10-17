class Country
  include Mongoid::Document
  
  field :name
  field :code
  field :numcode
  field :locale
  field :continent
  references_many :cities, :dependent => :destroy
  
  def to_param
    code.downcase
  end
end
