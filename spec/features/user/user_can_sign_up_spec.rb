require 'rails_helper'

describe 'Visitor' do
  context 'logs in' do
    it 'should log in user' do

      visit '/'

      click_on 'Sign Up to Be a User'

      expect(current_path).to eq(new_user_path)

      fill_in "user[username]", with: "funbucket13"
      fill_in "user[password]", with: "test"

      click_on "Create User"

      expect(page).to have_content("Welcome, funbucket13!")
    end
  end
end
