class User < ActiveRecord::Base

  has_many :activities

  has_secure_password

  validates_presence_of :username, :email, :password, :password_confirmation

  

end
