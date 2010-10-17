require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  
  before_filter :ensure_mapview

  protect_from_forgery
  
  def self.autocomplete(object, method, options = {})
    limit = options[:limit] || 10
    order = options[:order] || "#{method} ASC"

    define_method("autocomplete_#{object}_#{method}") do
      if params[:term] && !params[:term].empty?
        object.to_s.camelize.constantize.where(method => /^#{params[:term]}/).limit(limit).asc(method)
      else
        items = {}
      end

      render :json => json_for_autocomplete(items, (options[:display_value] ? options[:display_value] : method))
    end
  end
  
  def current_user
    logger.info session[:user_id]
    logger.info cookies[:remember_token]
    
    
    @current_user ||= if session[:user_id]
      Profile.find(session[:user_id])
    elsif cookies[:remember_token]
      Profile.find_by_remember_token(cookies[:remember_token])
    else
      false
    end
  end

  def ensure_mapview
    if params[:map] == 'no'
      cookies[:map] = 'no'
    elsif params[:map] == 'yes'
      cookies[:map] = 'yes'      
    end
    
    @map_view = cookies[:map] == 'yes'  
  end
  
  private
  def json_for_autocomplete(items, method)
    items.collect {|i| {"id" => i.id, "label" => i.send(method), "value" => i.send(method)}}
  end
end
