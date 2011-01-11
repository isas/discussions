# Main helpers for user views
module UsersHelper
  # Prepares image tag with right image for online status
  def online_status_image user
    image_tag(user.online? ? "online.png" : "offline.png")
  end
end