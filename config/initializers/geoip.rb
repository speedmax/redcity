require 'rack/geoip/base'

Redcity::Application.config.middleware.use "Rack::GeoIP::Base",
  :db => 'public/system/GeoLiteCity.dat'