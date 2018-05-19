require 'rails_helper'

describe Category, type: :model do
  describe 'validations' do
    it {should have_many(:ideas)}
  end
end
