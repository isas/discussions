class SessionsController < ApplicationController
  skip_before_filter :autentucated?
  
  def index
    if session[:user_id]
      flash.clear
      return redirect_to users_path
    end
    render :index, :layout => "session"
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id]=user.id
      session[:user_name]=user.user_name
      flash.clear
      return redirect_to users_path
    end
    flash[:warning] = "Login and/or password not correct!"
    render :index, :layout => "session"
  end
  
  def destroy
    reset_session
    render :index, :layout => "session"
  end
  
end