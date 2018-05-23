require 'rails_helper'

describe 'Visitor' do
  it 'admin can delete a specific category' do
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category_1 = create(:category, name: 'Art')
    category_2 = create(:category, name: 'Technology')

    admin_categories_path(category_1.admin)

    click_on 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to_not have_content(category_1)
    expect(page).to have_content(category_2)
  end
end
