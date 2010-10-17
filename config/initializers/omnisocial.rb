Omnisocial.setup do |config|
  
  # ==> Twitter
  # config.twitter 'APP_KEY', 'APP_SECRET'
  
  # ==> Facebook
  # config.facebook 'APP_KEY', 'APP_SECRET', :scope => 'publish_stream'
  
  if Rails.env.production?
    config.twitter 't1pBPuBzXzHSrWIfUGwvQ', 'eGtM2puiyBM39GFtmIUuo7QEM69hrUz57v9q0cTOI'
    config.facebook '526dca9d2234b347e77888310c1021ba', '4e1160f4443e5f355139b38f05c34818', :scope => 'publish_stream'

    # Configs for production mode go here
    
  elsif Rails.env.development?
    config.twitter 'XZGerhDvO7siDBzBxqvrHg', '0a1G7PuVHtM2M4CQ1PkUS7HR2TCOYuJ9iAMriCaII'
    
    config.facebook '532211c621839f34bfe533d22fdd8859', 'bc87f99e71b65457955212307f307a42', :scope => 'publish_stream'
  end
  
end

# 
# XZGerhDvO7siDBzBxqvrHg
# Consumer secret
# 0a1G7PuVHtM2M4CQ1PkUS7HR2TCOYuJ9iAMriCaII
# 
# Application ID
# 154082494627405
# API Key
# 532211c621839f34bfe533d22fdd8859
# Application Secret
# bc87f99e71b65457955212307f307a42

# produc
# Application ID
# 111179972278077
# API Key
# 526dca9d2234b347e77888310c1021ba
# Application Secret
# 4e1160f4443e5f355139b38f05c34818