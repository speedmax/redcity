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
      if profile = Profile.where('login_account.remote_account_id' => auth_hash['uid']).first
        profile.login_account.assign_account_info(auth_hash)

        profile
      else
        create_from_auth_hash(auth_hash)
      end
    end
  
    def self.create_from_auth_hash(auth_hash)
      profile = Profile.new
      profile.login_account = self.new
      profile.login_account.assign_account_info(auth_hash)
      profile.save
      
      profile
    end
  end
end