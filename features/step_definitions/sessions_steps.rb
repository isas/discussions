Given "User skaising created" do
  user = User.new(
    :user_name => "skaising", 
    :email => "ingus@fakemail.com", 
    :full_name => "Ingus Skaistkalns"
  )
  user.reset_password
end