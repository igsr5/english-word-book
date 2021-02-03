class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueless: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
