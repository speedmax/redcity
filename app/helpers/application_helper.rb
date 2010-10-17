module ApplicationHelper 
  def sidebar(&block)
    content_for :sidebar, capture(&block)
  end

  def local_url(options = {})
    if @city
      city_path(options.merge(:country_id => @country.to_param, :id => @city.to_param))
    elsif @country
      country_path(options.merge(:id => @country.to_param))    
    else
      root_path(options)
    end
  end
  
  def list_view?
    !map_view?
  end
  
  def map_view?
    @map_view
  end
end
