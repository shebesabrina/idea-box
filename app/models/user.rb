class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true

  has_secure_password

  enum role:[:default, :admin]
end
