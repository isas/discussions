# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :autentucated?
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private
  
  def autentucated?
    if session[:user_id]
      true
    else
      flash[:warning]='Please log in'
      redirect_to(:controller => 'sessions', :action => 'index')
      false
    end
  end
end
