class MessagesController < ApplicationController
  respond_to :html, :json
  
  def index
    @messages = Message.desc(:created_at)
    respond_with @messages
  end
  
  def show
    respond_with @message = Profile.find(params[:id])
  end

  def new
    respond_with @message = Message.new
  end
    
  def create
    @message = Message.new(params[:message])
    @message.created_at = Time.now
    @message.save
    respond_with @message
  end
    
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with @message
  end
end
