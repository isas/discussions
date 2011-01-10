# Controller thats handles tweet shoving
class TwittersController < ApplicationController
  def index
    @tweets = Twitter.user_timeline(current_user.twitter_name)
  rescue
    flash.now[:error] = "There is no tweets or twitter name is not correct"
    @tweets = []
  end
end