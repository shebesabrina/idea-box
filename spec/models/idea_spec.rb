require 'rails_helper'

describe Idea, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end

describe Idea, type: :model do
  describe 'relationship' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:idea_images) }
  end
end
