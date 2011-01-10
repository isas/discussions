# Users login/logout controller
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
      flash.now[:warning] = "Login and/or password not correct!"
      render :index, :layout => "session"
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end
  
  def password_reset
    render :password_reset, :layout => "session"
  end
  
  def submit_password_reset
    if (user = User.authorize params[:login], params[:email])
      user.reset_password
      flash[:notice] = "Password was reset successfully, #{user.full_name}!"
      redirect_to sessions_path
    else
      flash[:error] = "User not found!"
      render :password_reset, :layout => "session"
    end
  end
end