# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end
