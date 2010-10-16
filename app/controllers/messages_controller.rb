class MessagesController < ApplicationController
  respond_to :html, :json
  
  def index
    @messages = Message.all #need to change this to query on current_user.id when Devise is set up.
    respond_with @messages
  end
  
  def show
    respond_with @message = Profile.find(params[:id])
  end

  def new
    respond_with @message = Message.new
  end
  
  def edit
    respond_with @message = Message.find(params[:id])
  end
  
  def create
    @message = Message.new(params[:message])
    @message.save
    respond_with @message
  end
  
  def update
    @message = Message.find(params[:id])
    @message.update_attributes(params[:message])
    respond_with @message
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with @message
  end
end
