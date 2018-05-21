require 'rails_helper'
#Categories can be created and destroyed by a logged-in admin user
describe 'admin category new page' do
  it 'should display all categories' do
    category = create(:category)

    visit new_category_path

    fill_in 'category[name]', with: 'New Category'

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content('New Category')
  end
end
