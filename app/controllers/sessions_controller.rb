class SessionsController < ApplicationController
  skip_before_filter :autentucated?
  
  def index
    if current_user
      flash.clear
      redirect_to users_path
    else
      render :index, :layout => "session"
    end
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id]=user.id
      flash.clear
      redirect_to users_path
    else
      flash[:warning] = "Login and/or password not correct!"
      render :index, :layout => "session"
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end
  
end