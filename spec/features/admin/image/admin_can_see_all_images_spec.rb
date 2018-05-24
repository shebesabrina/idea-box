require 'rails_helper'

describe 'Admin' do
  context 'visits index page' do
    it 'should display all images' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image_1 = create(:image, name: 'pie')
      image_2 = create(:image, name: 'cake')

      visit images_path

      expect(page).to have_content('Check out those images')
      expect(page).to have_content(image_1.name)
      expect(page).to have_content(image_2.name)
      expect(page).to have_link('Create a new image')
    end
  end
end
