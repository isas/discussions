# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def menu_button(text)
    text + "<span class='tab-l'></span><span class='tab-r'></span>"
  end
  
  def new_button_or_back(params)
    if params[:action] == "index"
      link_to "New #{params[:controller].underscore.humanize.singularize.downcase}", new_polymorphic_path(params[:controller].singularize), :class => ("new_subject" if params[:controller] == "subjects")
    else
      link_to "Back to #{params[:controller].underscore.humanize.downcase}", polymorphic_path(params[:controller])
    end
  end
  
  def user_name_if_params_user_name(user_id, controller, size)
    if user_id
      user = User.find(user_id)
      "<strong style='color:black;'> #{user.full_name} #{controller.underscore.humanize.downcase} (#{size})</strong>"
    else
      "<strong style='color:black;'> #{controller.underscore.humanize} (#{size})</strong>"
    end
  end
  
  def subject?(controller)
    controller == "subjects" || controller == "books" || controller == "music_artists" || controller == "movies"
  end
  
  def flashes(flash)
    html = ["<div id='flashes'>"]
    flash.map do |key, value|
      html << "<div id='#{key}'>#{value}</div>"
    end
    html.push("</div>").join
  end
end
