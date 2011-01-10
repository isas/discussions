require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe User do
  before do
    @user = User.new(
      :user_name => "ingus", 
      :full_name => "Ingus Skaistkalns", 
      :email => "ingus@inbox.lv")
    @user.password = @user.password_confirmation = "pasw1"
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

  describe "working with password" do
    before do
      @user.password = @user.password_confirmation = "pasw1"
      @user.save
    end
    it "should be authenticated by user name and password" do
      User.authenticate("ingus", "pasw1").should_not be_nil
    end

    it "should not be authenticated by valid user name and invalid password" do
      User.authenticate("ingus", "password").should be_nil
    end
    
    it "should reset password and should not login with old password" do
      @user.reset_password
      User.authenticate("ingus", "pasw1").should be_nil
    end

    it "should reset password and login with new password" do
      @user.reset_password
      User.authenticate("ingus", @user.password_confirmation).should_not be_nil
    end
    
    it "should find user by login and email for password reset" do
      User.authorize(@user.user_name, @user.email).should_not be_nil
    end
  end
end
