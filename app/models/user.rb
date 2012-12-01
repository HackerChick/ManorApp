class User < ActiveRecord::Base
  has_secure_password
  has_many :units
  has_many :comments
end
