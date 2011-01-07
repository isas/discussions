# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def menu_button(text)
    text + "<span class='tab-l'></span><span class='tab-r'></span>"
  end
  
  def new_button(controller)
    if controller == "subjects" ||
        controller == "books" ||
        controller == "music_artists" ||
        controller == "movies"
    
      link_to "New #{controller.underscore.humanize.singularize.downcase}", new_polymorphic_path(controller.singularize), :class => ("new_subject" if controller == "subjects")
    end
  end
  
end
