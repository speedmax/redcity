class Geolocation < OpenStruct
  require 'open-uri'
  require 'cgi'
  
  def self.find(location)
    json = open("http://maps.google.com/maps/geo?q=#{CGI.escape(location)}")
    geo = ActiveSupport::JSON.decode(json)

    if geo["Status"]["code"] == 200
      address = geo["Placemark"].first["AddressDetails"]
      bounds = geo["Placemark"].first["ExtendedData"]["LatLonBox"]
      point = geo["Placemark"].first["Point"]
      region = address["Country"]["AdministrativeArea"]
      
      
      self.new(
        :name => geo["Placemark"].first["address"],
        :country_name => address["Country"]["CountryName"],
        :country_code => address["Country"]["CountryNameCode"],
        :region => region.try(:fetch, "AdministrativeAreaName"),
        :city => region.try(:[],"Locality").try(:[], "LocalityName"),
        :coordinates => point["coordinates"][0,2],
        :area => [bounds.values_at("south", "west"), bounds.values_at("north", "east")]
      )
    end
  end
  
  def self.service
    @geocoder ||= Graticule.service(:google).new GOOGLE_MAP_API
  end
end