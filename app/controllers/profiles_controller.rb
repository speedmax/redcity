class ProfilesController < ApplicationController
  respond_to :html, :json
  
  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = Profile.paginate(:page => params[:page])
    respond_with @profiles
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    respond_with @profile = Profile.where(:slug => params[:id]).first
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    respond_with @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    respond_with @profile = Profile.where(:slug => params[:id]).first
  end

  # GET /profiles/1/follow
  def follow
    @profile = Profile.where(:slug => params[:id]).first
    current_user.follow(@profile)
    redirect_to @profile
  end
  
  # GET /profiles/1/unfollow
  def unfollow
    @profile = Profile.where(:slug => params[:id]).first
    current_user.unfollow(@profile)
    redirect_to @profile
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    @profile = Profile.new(params[:profile])
    @profile.save
    respond_with @profile
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.where(:slug => params[:id]).first
    @profile.update_attributes(params[:profile])
    respond_with @profile
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.where(:slug => params[:id]).first
    @profile.destroy
    respond_with @profile
  end
end