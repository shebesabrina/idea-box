class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  # validates :password_digest, presence: true
  validates :username, presence: true
  has_many :ideas

  has_secure_password

  enum role:[:default, :admin]
end
