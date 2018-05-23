require 'rails_helper'

describe 'User visits category index page' do
  context 'as admin' do
    it 'allows admin to see all categories' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end
end


context 'as default user' do
  it 'does not allow default user to see admin categories index' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    expect(user.role).to eq('default')
    expect(user.default?).to be_truthy
  end
end
