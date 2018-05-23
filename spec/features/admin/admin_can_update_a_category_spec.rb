require 'rails_helper'

describe 'Visitor' do
  it 'admin can edit an existing category' do
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = create(:category, name: 'Art')

    visit edit_admin_category_path

    fill_in 'category[name]', with: category.name

    click_on 'Update Category'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content('Art')
  end
end
