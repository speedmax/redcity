class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :email
  field :interests, :type => Array
  field :setup,     :type => Boolean
  field :remember_token
  field :location
  field :location_string
  field :about

  references_one :login_account, :class_name => 'Omnisocial::LoginAccount', :dependent => :destroy
  references_many :messages, :dependent => :destroy

  delegate :login, :name, :picture_url, :account_url, :to => :login_account

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
  
  def interests=(string)
    self[:interests] = string.split(',').map(&:strip).compact
  end
end
