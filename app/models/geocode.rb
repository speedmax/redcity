class Geocode
  def self.find(location)
    service.locate(location)
  end
  
  def self.service
    @geocoder ||= Graticule.service(:google).new GOOGLE_MAP_API
  end
end