require 'rails_helper'

describe 'Admin' do
  context 'visits index page' do
    it 'should display all images' do

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image_1 = create(:image, name: 'pie', url: 'http://images.mentalfloss.com/sites/default/files/styles/insert_main_wide_image/public/iStock-636475496.jpg')
      image_2 = create(:image, name: 'cake', url: 'https://i1.wp.com/alles-dog.de/wp-content/uploads/2017/07/Fotolia_136456844_XS.jpg?w=656&h=438&crop&ssl=1')

      visit images_path

      expect(page).to have_content('Check out those images')
      expect(page).to have_content(image_1.name)
      expect(page).to have_content(image_1.url)
      expect(page).to have_content(image_2.name)
      expect(page).to have_content(image_2.url)
      expect(page).to have_link('Create a new image')
    end
  end
end
