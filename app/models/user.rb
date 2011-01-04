class User < ActiveRecord::Base
  
  
  
  
  def self.authenticate(login, password)
    User.find_by_user_name_and_password(login, password)
  end
end
