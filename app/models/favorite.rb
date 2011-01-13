class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  
  after_save :delete_if_rating_zero
  
  
private
  def delete_if_rating_zero
    self.destroy if self.rating == 0
  end
end
