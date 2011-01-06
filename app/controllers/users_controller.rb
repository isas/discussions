class UsersController < ApplicationController
  
  skip_before_filter :autentucated?, :only => [:new, :create]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render :action => "show", :layout => false
  end

  def new
    @user = User.new
    if session[:user_id].present?
      render :partial => "new"
    else
      render :action => "new", :layout => false
    end
    
  end

  def edit
    @user = User.find(params[:id])
    render :action => "edit", :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      if session[:user_id].present?
        render :partial => "one_user"
      else
        flash[:notification] = "User was successfully created"
        render :template => "sessions/index", :layout => false
      end
    else
      if session[:user_id].present?
        render :partial => "new"
      else
        render :action => "new", :layout => false
      end
      
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render :partial => "one_user"
    else
      render :action => "edit", :layout => false
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url)
  end
end
