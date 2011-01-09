class Subject < ActiveRecord::Base
  belongs_to :user

  named_scope :ordered, :order => "created_at DESC"
  named_scope :where_user_id, lambda{|user_id|{:conditions => [%{user_id = ?}, user_id]}}
  
  before_create :set_user
  
  validates_presence_of :title, :description, :user
  
  protected
  def set_user
   self.user= User.current_user
  end
end
