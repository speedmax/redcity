module Omnisocial
  class LoginAccount
    include Mongoid::Document 

    field :type
    field :user_id
    field :remote_account_id
    field :name
    field :login
    field :picture_url

    embedded_in :profile, :inverse_of => :login_account

    def self.find_or_create_from_auth_hash(auth_hash)
      if account = self.first(:conditions => {:remote_account_id => auth_hash['uid']})
        account.assign_account_info(auth_hash)
        account.save
        account
      else
        create_from_auth_hash(auth_hash)
      end
    end
  
    def self.create_from_auth_hash(auth_hash)
      account = self.new
      account.assign_account_info(auth_hash)
      account.save
      account
    end
  
    def find_or_create_user
      return self.profile if self.profile
    
      profile = Profile.new(:login_account => self)
      profile.save
      profile
    end
  end
end