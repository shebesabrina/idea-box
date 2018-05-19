class Image < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :url
  
  has_many :idea_images
end
