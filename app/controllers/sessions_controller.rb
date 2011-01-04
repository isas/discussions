class SessionsController < ApplicationController
  skip_before_filter :autentucated?
  
  def index
    if session[:user_id]
      flash.clear
      return redirect_to users_path
    end
    render :index, :layout => "session"
  end
  
end