class Book < Subject
  #validates_presence_of :title#, :password, :full_name, :email
  
  def author?
    true
  end
  
  def year?
    true
  end
    
  def director?
    false
  end
    
  def origin?
    false
  end
        
  def music_type?
    false
  end
  
end