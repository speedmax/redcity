class CountriesController < ApplicationController
  # GET /countries
  # GET /countries.xml
  def index
    @countries = Country.all
    respond_with(@countries)
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
    @country = Country.where(:code => params[:id].upcase).first
    respond_with(@country)
  end

  # GET /countries/new
  # GET /countries/new.xml
  def new
    @country = Country.new
    respond_with(@country)
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])
    @country.save
    respond_with(@country)
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])
    @country.update_attributes(params[:country])
    respond_with(@country)
  end

  # DELETE /countries/1
  # DELETE /countries/1.xml
  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    respond_with(@country)
  end
end
