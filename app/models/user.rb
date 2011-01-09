class User < ActiveRecord::Base
  has_many :subjects
  has_many :books
  has_many :movies
  has_many :music_artists
  has_many :comments
  
  validates_presence_of :user_name, :password, :full_name, :email
  validates_uniqueness_of :user_name, :email
  validates_confirmation_of :password, :if => :password_changed?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  class << self
    attr_accessor :current_user
  end
  
  before_save :hash_password
  
  attr_protected :password, :password_confirmation
  
  SALT = "d1ScuSs10N"
  PASSWORD_SIZE = 8
  CHARS = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  SIZE = CHARS.size
  
  # Looks for user by username and password
  def self.authenticate(login, password)
    password = Digest::SHA512.hexdigest("#{SALT}#{password}")
    User.find_by_user_name_and_password(login, password)
  end
  
  # Generates new password and sets on attributes
  def reset_password
    range = (1..PASSWORD_SIZE)
    self.password = range.collect{ CHARS[rand(SIZE)] }.join
    self.password_confirmation = self.password
  end
  
  private
  # Hashes password before saving only if password has changed
  def hash_password
    self.password = Digest::SHA512.hexdigest("#{SALT}#{password}") if password_changed?
  end
end
