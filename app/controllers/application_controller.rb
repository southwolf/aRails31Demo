class ApplicationController < ActionController::Base
  helper_method :admin?
  before_filter :authorize
  
  protect_from_forgery
  
  protected
  
  def admin?
    session[:name] == "login" && session[:pw] == "password"
  end
  
  def authorize
    unless admin?
      redirect_to root_url
    end    
  end
end
