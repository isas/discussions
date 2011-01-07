require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe ErrorsHelper do
  it "should render proper html list with error messages" do
    user = User.new
    user.valid?
    
    result = helper.custom_error_messages_for([user])
    result.should =~ /\<ul\>\<li\>/i
    result.should =~ /.*\<strong\>Full name\<\/strong\>\,/i
    result.should =~ /.*\<strong\>Email\<\/strong\>\,/i
    result.should =~ /.*\<strong\>Password\<\/strong\> and/i
    result.should =~ /.*\<strong\>User name\<\/strong\>/i
    result.should =~ /\<\/li\>\<\/ul\>/i
  end
  
  it "should render nothing since user does not have any errors" do
    user = User.new
    result = helper.custom_error_messages_for([user])
    result.should be_nil
  end
end