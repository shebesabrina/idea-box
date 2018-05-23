require 'rails_helper'

describe 'Visitor' do
  context 'user that logs in as an admin' do
    it 'should allow admin to create an image' do

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image = create(:image, name: 'Mountains')

      visit images_path

      expect(page).to have_link('Create a new image')

      click_on 'Create a new image'

      fill_in 'image[name]', with: image.name
      fill_in 'image[url]', with: image.url

      click_on 'Create Image'

      expect(current_path).to eq(images_path)
      expect(page).to have_content('Mountains')
    end
  end
end
