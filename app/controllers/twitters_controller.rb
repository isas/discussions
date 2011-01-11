# Controller thats handles tweet shoving
class TwittersController < ApplicationController
  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    @user ||= current_user
    @tweets = Twitter.user_timeline(@user.twitter_name)
  rescue
    flash.now[:error] = "There is no tweets or twitter name is not correct"
    @tweets = []
  end
end