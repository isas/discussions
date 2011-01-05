require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe User do
  
  before do
    @user = User.new(
      :user_name => "ingus", 
      :password => "pasw1", 
      :full_name => "Ingus Skaistkalns", 
      :email => "ingus@inbox.lv")
  end
  
  it "should not be valid without password" do
    @user.password = nil
    @user.valid?.should be_false
  end
  it "should not be valid without user_name" do
    @user.user_name = nil
    @user.valid?.should be_false
  end
  it "should not be valid without full_name" do
    @user.full_name = nil
    @user.valid?.should be_false
  end
  it "should not be valid without email" do
    @user.email = nil
    @user.valid?.should be_false
  end
  
  it "should be valid user with all required data" do
    @user.valid?.should be_true
  end
  
  it "should be authenticated by user name and pasword" do
    @user.save
    User.authenticate("ingus", "pasw1")
  end
end
