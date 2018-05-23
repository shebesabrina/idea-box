require 'rails_helper'
# An idea can be edited/updated only by the user that created it.
describe 'user edit page' do
  it 'should allow user to update an existing idea' do
    idea = create(:idea)
    category = create(:category)

    visit edit_user_idea_path(idea.user, idea)

    fill_in 'idea[title]', with: 'Edit Title'
    fill_in 'idea[description]', with: 'Edit Description'
    select "#{category.name}", from: 'idea[category_id]'

    click_on 'Update Idea'

    expect(current_path).to eq(user_idea_path(idea.user, idea))
    expect(page).to have_content('Edit Title')
  end
end
