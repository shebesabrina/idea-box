class Idea < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description

  belongs_to :category
  
  has_many :idea_images
end
