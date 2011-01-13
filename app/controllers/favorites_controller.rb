class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all(:conditions => "user_id = #{current_user.id}")
    render :partial => "index", :locals => {:favorites => @favorites}
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    flash.now[:notice] = "Favorite was not created"
    if @favorite.rating > 0
      @favorite.user = current_user
      @favorite.save
      flash.now[:notice] = "Favorite rating - #{@favorite.rating}"
    end
    render :partial => "new", :locals => {:favorite => @favorite}
  end
  
  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update_attributes(params[:favorite]) 
    flash.now[:notice] = "Favorite rating - #{@favorite.rating}"
    if @favorite.rating == 0
      flash.now[:notice] = "Favorite was removed"
      @favorite = Favorite.new({:subject_id => @favorite.subject_id})
    end
    render :partial => "new", :locals => {:favorite => @favorite}
  end
end
