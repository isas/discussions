class User < ActiveRecord::Base
  has_many :subjects
  has_many :books
  has_many :movies
  has_many :music_artists
  has_many :comments
  has_many :favorites
  
  validates_presence_of :user_name, :password, :full_name, :email
  validates_uniqueness_of :user_name, :email
  validates_confirmation_of :password, :if => :password_changed?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  class << self
    attr_accessor :current_user
    
    # Looks for user by username and password
    def authenticate login, password
      password = Digest::SHA512.hexdigest("#{SALT}#{password}")
      find_by_user_name_and_password login, password
    end
    
    # Looks for user by username and email
    def authorize login, email
      find_by_user_name_and_email login, email
    end
  end
  
  before_save :hash_password
  
  attr_protected :password, :password_confirmation
  
  SALT           = "d1ScuSs10N"
  PASSWORD_RANGE = 1..8
  CHARS          = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  SIZE           = CHARS.size
  
  # Generates new password and sets on attributes
  def reset_password
    self.password = PASSWORD_RANGE.collect{ CHARS[rand(SIZE)] }.join
    self.password_confirmation = self.password
    PasswordReset.deliver_password_reset(self)
    save
  end
  
  private
  # Hashes password before saving only if password has changed
  def hash_password
    self.password = Digest::SHA512.hexdigest("#{SALT}#{password}") if password_changed?
  end
end
