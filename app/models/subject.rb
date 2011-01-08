class Subject < ActiveRecord::Base
  
  validates_presence_of :title, :description, :user_id
  
  belongs_to :user
  
  #TODO: set current user in before filter - not in controllers (subjects, books...)
  #before_save :add_user
  
  named_scope :all_ordered, :order => "created_at DESC"
  
private
  def add_user
   self.user=current_user
  end
end
