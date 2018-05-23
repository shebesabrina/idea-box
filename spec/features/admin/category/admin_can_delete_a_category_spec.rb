require 'rails_helper'

describe 'Admin' do
  it 'admin can delete a specific category' do
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category_1 = create(:category, name: 'Art')
    category_2 = create(:category, name: 'Technology')

    visit categories_path

    within("#category_#{category_1.id}") do

      click_on 'Delete'
    end

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(category_1)
    expect(page).to have_content(category_2.name)
  end
end
