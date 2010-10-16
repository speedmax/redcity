class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :type
  field :email
  field :interests, :type => Array
  field :setup,     :type => Boolean
  field :remember_token
  field :location,  :type => Array
  field :location_string
  field :about

  embeds_one :address
  embeds_one :login_account, :class_name => 'Omnisocial::LoginAccount'
  delegate :login, :name, :picture_url, :account_url, :to => :login_account

  references_many :followings, :stored_as => :array, :inverse_of => :followers, :class_name => 'Profile'
  references_many :followers, :stored_as => :array, :inverse_of => :followings, :class_name => 'Profile'
  references_many :following_cities, :stored_as => :array, :inverse_of => :followers, :class_name => 'City'  
  references_many :messages, :dependent => :destroy

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
  
  def followed?(user)
    following_ids && following_ids.include?(user.id)
  end
  
  def follow(user)
    self.followings << user
  end
  
  def unfollow(user)
    if followed?(user)
      self.following_ids = following_ids - [user.id]
      user.follower_ids = follower_ids - [self.id]
      self.save
      user.save
    end
  end
  
  def interests_list 
    interests.join(', ') if interests
  end
  
  def interests=(string)
    self[:interests] = string.split(',').map(&:strip).compact
  end
end
