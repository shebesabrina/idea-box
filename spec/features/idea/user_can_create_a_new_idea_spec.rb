require 'rails_helper'
# An idea can be created by a user.
describe 'user new page' do
  xit 'should allow user to create an idea' do

    visit new_idea_path

    expect(page).to have_button("Create Idea")

    fill_in 'idea[title]', with: 'New Title'
    fill_in 'idea[description]', with: 'New Description'
    # save_and_open_page
    click_on 'Create Idea'

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content('New Title')
    expect(page).to have_content('New Description')
  end
end
