class User < ActiveRecord::Base
  has_many :subjects
  has_many :books
  has_many :movies
  has_many :music_artists
  
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
  
  def self.authenticate(login, password)
    password = Digest::SHA512.hexdigest("#{SALT}#{password}")
    User.find_by_user_name_and_password(login, password)
  end
  
  private
  def hash_password
    self.password = Digest::SHA512.hexdigest("#{SALT}#{password}") if password_changed?
  end
end
