require 'rails_helper'

describe Image, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
  end
end

describe Image, type: :model do
  describe 'relationship' do
    it { should have_many(:idea_images) }
  end
end
