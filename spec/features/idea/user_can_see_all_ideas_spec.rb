require 'rails_helper'

describe 'user index page' do
  it 'should display all user ideas' do
    idea = create(:idea)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(idea.user)

    expect(page).to have_content(idea.title)
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end
