require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Comment do
  before do
    @comment = Comment.new
  end
  
  it "should not be valid without user, subject, text" do
    @comment.valid?.should be_false
    @comment.errors.on(:text).present?.should be_true
    @comment.errors.on(:user_id).present?.should be_true
    @comment.errors.on(:subject_id).present?.should be_true
  end
  
  it "shold be valid with correct user, subject, text" do
    @comment.user_id = 1
    @comment.subject_id = 1
    @comment.text = "Andris comment"
    @comment.valid?.should be_true
  end
  
end
