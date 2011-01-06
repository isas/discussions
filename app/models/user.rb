class User < ActiveRecord::Base
  validates_presence_of :user_name, :password, :full_name, :email
  validates_uniqueness_of :user_name, :email
  
  def self.authenticate(login, password)
    User.find_by_user_name_and_password(login, password)
  end
end
