task :import_cities => :environment do
  require 'csv'
  
  CSV.parse(open('db/Countries_utf8.txt'), :headers => true).each do |c| 
    name, code, numcode, continent = c.values_at(
      'Country', 'ISO2', 'CountryId', 'MapReference'
    ).map(&:strip)
    Country.create(:name => name, :code => code, :numcode => numcode, :continent => continent)
  end
  # 
  # regions = CSV.parse(open('db/Regions_utf8.txt'), :headers => true).to_a
  # regions.shift
  # 
  # CSV.parse(open('db/Cities_utf8.txt'), :headers => true).each do |city| 
  #   country_id, region_id, name, latitude, longitude, timezone, code = city.values_at(
  #     'CountryID', 'RegionID', 'City', 'Latitude', 'Longitude', 'TimeZone', 'Code'
  #   ).map(&:strip)
  #   country = Country.where(:numcode => country_id).first
  #   region = regions.find{|r| r.first == region_id }[2].strip
  # 
  #   City.create(
  #     :name => name, :region => region, :country => country, 
  #     :location => [latitude.to_f, longitude.to_f], :timezone => timezone
  #   )
  # end
end