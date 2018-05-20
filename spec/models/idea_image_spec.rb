require 'rails_helper'

describe IdeaImage, type: :model do
  describe 'relationship' do
    it {should belong_to(:idea)}
    it {should belong_to(:image)}
  end
end
