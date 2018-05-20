require 'rails_helper'

describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end

describe Category, type: :model do
  describe 'relationship' do
    it { should have_many(:ideas) }
  end
end
