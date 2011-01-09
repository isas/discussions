require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Subject do
  it "should have user before saving" do
    User.current_user = User.new(:user_name => "Test_dummy")
    subject = Subject.new(:title => "Subject")
    subject.valid?
    subject.user.should == User.current_user
  end
end