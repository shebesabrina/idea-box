require 'rails_helper'

describe 'Visitor' do
  context 'user that logs in as an admin' do
    it 'should allow admin to create a category' do

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category = create(:category, name: 'New Category')

      visit admin_categories_path

      expect(page).to have_link('Create a new category')

      fill_in 'category[name]', with: category.name

      click_on 'Create Category'

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content('New Category')
    end
  end
end
