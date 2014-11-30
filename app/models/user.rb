class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 6, :message => "At least 6 characters"
  validates_format_of :password, :with => /^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$/, :message => "Must be at least 6 characters, one number, one uppercase, and one special character"

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :on => :create, :message => "Not a valid email address"

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
