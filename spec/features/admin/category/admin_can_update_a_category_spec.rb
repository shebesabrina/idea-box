require 'rails_helper'

describe 'Admin' do
  it 'admin can edit an existing category' do
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category_1 = create(:category, name: 'Art')
    category_2 = create(:category, name: 'Technology')

    visit categories_path

    within("#category_#{category_1.id}") do
      click_on 'Edit'
    end

    expect(current_path).to eq(edit_admin_category_path(category_1))
    fill_in 'category[name]', with: category_2.name

    click_on 'Update Category'

    expect(current_path).to eq(category_path(category_1))
    expect(page).to have_content(category_2.name)
  end
end
