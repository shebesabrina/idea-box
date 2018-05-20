require 'rails_helper'
# An idea can be created by a user.
describe 'user new page' do
  it 'should allow user to create an idea' do
    category = Category.create(name: 'Adventure')
    idea = Idea.create(title: 'New title', description: 'New Description', category: category)

    visit new_idea_path

    expect(page).to have_button("Create Idea")
    # click_on 'Create Idea'
  end
end
