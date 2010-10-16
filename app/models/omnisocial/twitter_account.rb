module Omnisocial
  class TwitterAccount < LoginAccount
    def assign_account_info(auth_hash)
      self.remote_account_id  = auth_hash['uid']
      self.login              = auth_hash['user_info']['nickname']
      self.picture_url        = auth_hash['user_info']['image']
      self.name               = auth_hash['user_info']['name']
      self.profile.location   = parse_location(auth_hash['user_info']['location'])
    end
  
    def account_url
      "http://twitter.com/#{self.login}"
    end
    
    def parse_location(location)
      if location.match /(-?\d+\.\d+),(-?\d+\.\d+)/
        [$1.to_f, $2.to_f]
      elsif result = Geocode.find(location)
        result.coordinates
      end
    end
  end
end