require 'rails_helper'

describe 'Visitor' do
  context 'logs in' do
    it 'user can fill out a form successfully' do

      visit '/'

      click_on 'Sign Up to Be a User'

      expect(current_path).to eq(new_user_path)

      fill_in 'user[username]', with: 'jelly bean'
      fill_in 'user[email]', with: 'something@gmail.com'
      fill_in 'user[password]', with: 'password'

      click_on 'Create User'

      # save_and_open_page
      expect(page).to have_content("Welcome, #{User.last.username}")
      expect(current_path).to eq(user_path(User.last))
    end
  end
end

describe 'Visitor' do
  it 'user can sign out successfully' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_link('Log out')

    click_on 'Log out'

    expect(current_path).to eq(root_path)
  end
end

describe 'Visitor' do
  it 'allows user to sign into their accout' do
    user = create(:user)

    visit '/'

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
  end
end

describe 'Visitor' do
  it 'allows user to sign in with a unique email' do
    user = create(:user)

    visit '/'

    click_on 'Sign Up to Be a User'
    # save_and_open_page

    expect(current_path).to eq(new_user_path)

    fill_in 'user[username]', with: user.username
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_on 'Create User'

    expect(current_path).to eq(users_path)
    expect(page).to have_content('Registration failed')
  end
end
