class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true

  has_secure_password
  # e.g., User.authenticate('penelope@turing.com', 'boom')
  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end
