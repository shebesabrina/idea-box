require 'rails_helper'
# An idea can be created by a user.
describe 'user new page' do
  it 'should allow user to create an idea' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = create(:category)

    visit new_user_idea_path(user)

    expect(page).to have_button("Create Idea")

    fill_in 'idea[title]', with: 'New Title'
    fill_in 'idea[description]', with: 'New Description'
    select "#{category.name}", from: 'idea[category_id]'
    # save_and_open_page
    click_on 'Create Idea'

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to have_content('New Title')
    expect(page).to have_content('New Description')
  end
end
