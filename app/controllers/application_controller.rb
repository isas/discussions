class ApplicationController < ActionController::Base
  before_filter :autentucated?, :set_current_user
  
  helper :all
  protect_from_forgery

  filter_parameter_logging :password
  
  protected 
  # Sets current user from sessions user_id
  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
  helper_method :current_user
  
  # Checks if user_id is set, if not => redirect_to login page
  def autentucated?
    if session[:user_id]
      true
    else
      flash[:warning]='Please log in'
      redirect_to sessions_path
      false
    end
  end
  
  # sets current user in User model
  def set_current_user
    User.current_user = current_user
  end
end
