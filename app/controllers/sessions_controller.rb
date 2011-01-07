class SessionsController < ApplicationController
  skip_before_filter :autentucated?
  
  def index
    if current_user
      flash.clear
      redirect_to subjects_path
    else
      render :index, :layout => "session"
    end
  end
  
  def create
    flash.clear
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id]=user.id
      redirect_to subjects_path
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