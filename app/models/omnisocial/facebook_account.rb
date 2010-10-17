module Omnisocial
  class FacebookAccount < LoginAccount
    def assign_account_info(auth_hash)
      Rails.logger.info auth_hash
      self.remote_account_id  = auth_hash['uid']
      self.login              = auth_hash['user_info']['nickname']
      self.name               = auth_hash['user_info']['name']
      
      self.profile.name ||= self.name
      self.profile.type ||= 'Individual'
    end
  
    def account_url
      "http://facebook.com/#{self.login}"
    end
  
    def picture_url
      login = self.login
      if self.login.include?('profile.php')
        login = self.login.gsub(/[^\d]/, '')
      end
      
      "https://graph.facebook.com/#{login}/picture?type=square"
    end
  end
end