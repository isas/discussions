module FavoritesHelper
  
  def get_favorite(subject)
    if subject.user_favorite  
      html = []
      html << "<span class='favorites' title='rating - #{subject.user_favorite.rating}'>"
      html << "[#{subject.user_favorite.rating}]"
      html << "</span>"
      html.join
    end
  end
end