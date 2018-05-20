require 'rails_helper'
# An idea can be created by a user.
describe 'user new page' do
  it 'should allow user to create an idea' do
    category = create(:category)

    visit new_idea_path
    # save_and_open_page

    expect(page).to have_button("Create Idea")

    fill_in 'idea[title]', with: 'New Title'
    fill_in 'idea[description]', with: 'New Description'
    select "#{category.name}", from: 'idea[category_id]'
    click_on 'Create Idea'

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content('New Title')
    expect(page).to have_content('New Description')
  end
end
