Omnisocial.setup do |config|
  
  # ==> Twitter
  # config.twitter 'APP_KEY', 'APP_SECRET'
  
  # ==> Facebook
  # config.facebook 'APP_KEY', 'APP_SECRET', :scope => 'publish_stream'
  
  if Rails.env.production?

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