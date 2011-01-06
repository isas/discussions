class UsersController < ApplicationController
  
  skip_before_filter :autentucated?, :only => [:new, :create]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render :action => "new", :layout => false
  end

  def edit
    @user = User.find(params[:id])
    render :action => "edit", :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notification] = "User was successfully created"
      render :template => "sessions/index", :layout => false
    else
      render :action => "new", :layout => false
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'User was successfully updated.')
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
