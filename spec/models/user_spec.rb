require 'rails_helper'

describe User, type: :model do
  context 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
  end
end

describe 'roles' do
  it 'can be created as an admin' do
    admin = create(:user, role: 1)

    expect(admin.role).to eq('admin')
    expect(admin.admin?).to be_truthy
  end

  it 'can be created as a default user' do
    user = create(:user)

    expect(user.role).to eq('default')
    expect(user.default?).to be_truthy
  end
end
