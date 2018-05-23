require 'rails_helper'
#Categories can be created and destroyed by a logged-in admin user
describe 'User visits category index page' do
  context 'as admin' do
    it 'allows admin to see all categories' do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path
      expect(page).to have_content('Admin Categories')
    end
  end
end


context 'as default user' do
  it 'does not allow default user to see admin categories index' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path

    expect(page).to_not have_content('Admin Categories')
    expect(page).to have_content('The page you were looking for doesn\'t exist')
  end
end
