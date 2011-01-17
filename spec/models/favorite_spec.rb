require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Favorite do
  before do
    @favorite = Favorite.new
  end
  
  it "should not be valid without user, subject" do
    @favorite.valid?.should be_false
    @favorite.errors.on(:user_id).present?.should be_true
    @favorite.errors.on(:subject_id).present?.should be_true
  end
  
  it "shold be valid with correct user, subject" do
    @favorite.user_id = 1
    @favorite.subject_id = 1
    @favorite.valid?.should be_true
  end
  
  it "should save and get valid favorite" do
    @favorite.rating = 3
    @favorite.user_id = 1
    @favorite.subject_id = 1
    @favorite.save
    @favorite = Favorite.first
    @favorite.rating.should == 3
  end
  
  it "should delete favorite with rating 0 - after save" do
    @favorite.rating = 0
    @favorite.user_id = 1
    @favorite.subject_id = 1
    @favorite.save
    @favorite = Favorite.first
    @favorite.should be_nil
  end
  
end
