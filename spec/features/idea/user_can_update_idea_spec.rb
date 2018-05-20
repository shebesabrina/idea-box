require 'rails_helper'
# An idea can be edited/updated only by the user that created it.
describe 'user edit page' do
  it 'should allow user to update an existing idea' do
    idea = create(:idea)

    visit edit_idea_path(idea)

    fill_in 'idea[title]', with: 'Edit Title'
    fill_in 'idea[description]', with: 'Edit Description'

    click_on 'Update Idea'

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content('Edit Title')
  end
end
