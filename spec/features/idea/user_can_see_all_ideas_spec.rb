require 'rails_helper'

describe 'user index page' do
  it 'should display all user ideas' do
    idea = create(:idea)

    visit user_ideas_path(idea.user)

    expect(page).to have_content(idea.title)
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end
