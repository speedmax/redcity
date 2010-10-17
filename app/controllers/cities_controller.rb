class CitiesController < ApplicationController
  before_filter :load_country
  
  # GET /cities
  # GET /cities.xml
  def index
    @cities = @country.cities.all
    respond_with(@cities)
  end

  # GET /cities/1
  # GET /cities/1.xml
  def show
    @city = City.where(:slug => params[:id]).first
    
    @messages = Message.near(:location => @city.location).paginate(:page => params[:page])
    
    respond_with(@city)
  end

  # GET /cities/new
  # GET /cities/new.xml
  def new
    @city = City.new
    respond_with(@city)
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
  end

  # POST /cities
  # POST /cities.xml
  def create
    @city = City.new(params[:city])
    @city.save
    respond_with(@city)
  end

  # PUT /cities/1
  # PUT /cities/1.xml
  def update
    @city = City.find(params[:id])
    @city.update_attributes(params[:city])
    respond_with(@city)
  end

  # DELETE /cities/1
  # DELETE /cities/1.xml
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    respond_with(@city)
  end
  
  private
    def load_country
      @country = Country.where(:code => params[:country_id].try(:upcase)).first
    end
end
