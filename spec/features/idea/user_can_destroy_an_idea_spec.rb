require 'rails_helper'
# An idea can be destroyed only by the user that created it.
describe 'user destroy page' do
  it 'should allow user to delete an existing idea' do
    idea = create(:idea)

    visit ideas_path

    click_on 'Delete'

    expect(current_path).to eq(ideas_path)
    expect(page).to_not have_content(idea)
  end
end
