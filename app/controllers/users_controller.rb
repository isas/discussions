class UsersController < ApplicationController
  
  skip_before_filter :autentucated?, :only => [:new, :create]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render "show", :layout => false
  end

  def new
    @user = User.new
    render "new", :layout => false    
  end

  def edit
    @user = User.find(params[:id])
    render "edit", :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      if current_user
        render :partial => "one_user"
      else
        flash[:notification] = "User was successfully created"
        render :template => "sessions/index", :layout => false
      end
    else
      render "new", :layout => false
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render :partial => "one_user"
    else
      render "edit", :layout => false
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to(users_url)
  end
end
