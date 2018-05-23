class Idea < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description

  belongs_to :category
  belongs_to :user

  has_many :idea_images
end
