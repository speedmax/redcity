require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery
  
  
  def current_user
    @current_user ||= if session[:user_id]
      Profile.find(session[:user_id])
    elsif cookies[:remember_token]
      Profile.find_by_remember_token(cookies[:remember_token])
    else
      false
    end
  end

end
