class CitiesController < ApplicationController
  # GET /cities
  # GET /cities.xml
  def index
    @cities = City.all
    respond_with(@cities)
  end

  # GET /cities/1
  # GET /cities/1.xml
  def show
    @city = City.find(params[:id])
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
end
