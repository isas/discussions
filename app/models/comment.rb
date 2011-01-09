class Comment < ActiveRecord::Base
  
  validates_presence_of :text, :subject_id, :user_id
  
  belongs_to :user
  belongs_to :subject
end
