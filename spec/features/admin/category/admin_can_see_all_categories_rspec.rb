require 'rails_helper'

describe 'Admin' do
  context 'user that logs in as an admin' do
    it 'should allow admin to create a category' do

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category_1 = create(:category, name: 'Art')
      category_2 = create(:category, name: 'Technology')

      visit categories_path

      expect(page).to have_content(category_1)
      expect(page).to have_content(category_2)
    end
  end
end
