require 'rails_helper'

describe 'user index page' do
  it 'should display all user ideas' do
    idea = create(:idea)

    visit ideas_path

    expect(page).to have_content(idea.title)
    # expect(page).to have_content(idea_2.title)
  end
end
