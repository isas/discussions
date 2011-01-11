class Subject < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites
  
  validates_presence_of :title, :description, :user

  named_scope :ordered, :order => "created_at DESC"
  named_scope :where_user_id, lambda{|user_id|{:conditions => [%{user_id = ?}, user_id]}}
  
  before_validation_on_create :set_user
  
  def user_favorite
    favorites.select{|f|f.user = User.current_user}[0]
  end
  
  protected
  def set_user
   self.user= User.current_user
  end
end
