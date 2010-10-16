class MessagesController < ApplicationController
  include Responders::CollectionResponder

  respond_to :html, :json
  require_user :only => [:new, :create]
  
  def index
    @messages = Message.desc(:created_at)
    respond_with @messages
  end
  
  def show
    respond_with @message = Message.find(params[:id])
  end

  def new
    respond_with @message = current_user.messages.new
  end
    
  def create
    @message = current_user.messages.build(params[:message])
    @message.save
    respond_with @message
  end
    
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with @message
  end
end
