class User < ActiveRecord::Base
  validates_presence_of :user_name, :password, :full_name, :email
  validates_uniqueness_of :user_name, :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  attr_accessor :password_confirmation
  
  def self.authenticate(login, password)
    User.find_by_user_name_and_password(login, password)
  end
end
