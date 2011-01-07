class Subject < ActiveRecord::Base
  
  validates_presence_of :title, :dscription, :user_id
  
  belongs_to :user
  
  #TODO: set current user in before filter - not in controllers (subjects, books...)
  #before_save :add_user
  
  
private
  def add_user
   self.user=current_user
  end
end
