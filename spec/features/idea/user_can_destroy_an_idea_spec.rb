require 'rails_helper'
# An idea can be destroyed only by the user that created it.
describe 'user destroy page' do
  it 'should allow user to delete an existing idea' do
    idea = create(:idea)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(idea.user)

    click_on 'Delete'

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to_not have_content(idea)
  end
end
