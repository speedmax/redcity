class MessagesController < ApplicationController

  respond_to :html, :json
  require_user :only => [:new, :create]
  
  def index
    @messages = Message.active.desc(:created_at)
        
    if params[:country_id]
      @country = Country.find(params[:country_id])
      city_ids = @country.cities.only(:id).map(&:id)
      
      @messages = @messages.any_in(:city_id => city_ids).paginate(:page => params[:page])
    end

    if params[:city_id]
      @city = City.find(params[:city_id])
      @messages = @messages.near(:location => @city.location).paginate(:page => params[:page])
    end

    respond_with @messages
  end
  
  def show
    respond_with @message = Message.find(params[:id])
  end

  def new
    respond_with @message = current_user.messages.new
  end

  # POST /messages/1/reply
  def reply
    @message = Message.find(params[:id])
    reply = current_user.messages.build(params[:message])
    
    reply.location ||= current_user.location
    reply.city ||= current_user.city
    
    @message.replies << reply
    reply.save
    respond_with @message
  end

  def create
    @message = current_user.messages.build(params[:message])
    
    @message.location ||= current_user.location
    @message.city ||= current_user.city
    
    @message.save
    respond_with @message, :location => messages_path
  end
    
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with @message, :location => messages_path
  end
end
