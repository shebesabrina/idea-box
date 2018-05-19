require 'rails_helper'

describe Idea, type: :model do
  describe 'validations' do
    it { should belong_to(:category) }
  end
end
