class ApplicationController < ActionController::Base
  before_filter :autentucated?
  
  helper :all
  protect_from_forgery

  filter_parameter_logging :password
  
  protected  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user
  
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
