class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all(:conditions => "user_id = #{current_user.id}")
    render :partial => "index", :locals => {:favorites => @favorites}
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.rating > 0
      @favorite.user = current_user
      @favorite.save
      flash.now[:notice] = "Favorite rating - #{@favorite.rating}"
    else
      flash.now[:notice] = "Favorite was not created"
    end
    render :partial => "new", :locals => {:favorite => @favorite}
  end
  
  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update_attributes(params[:favorite])
    
    @favorite = destroy_if_rating_zero(@favorite)
      
    flash.now[:notice] = "Favorite rating - #{@favorite.rating}" unless flash[:notice]
    render :partial => "new", :locals => {:favorite => @favorite}

  end
  
  private
  def destroy_if_rating_zero(favorite)
    if favorite.rating == 0
      favorite_new = Favorite.new({:subject_id => favorite.subject_id})
      favorite.destroy
      flash.now[:notice] = "Favorite was removed"
      return favorite_new
    end
    return favorite;
  end
end
