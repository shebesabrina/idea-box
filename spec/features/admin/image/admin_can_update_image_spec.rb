require 'rails_helper'

describe 'Admin' do
  context 'visits edit page' do
    it 'allows admin to update existing image' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image_1 = create(:image, name: 'pie', url: 'https://www.instagram.com/p/BjIv6Q_Fe43/?explore=true')
      image_2 = create(:image, name: 'cake', url: 'https://www.instagram.com/p/BjHoaP1Fasq/?explore=true')

      visit images_path

      within("image_#{image_1.id}") do
        click_on 'Edit'
      end

      expect(current_path).to eq(edit_admin_image_path(image_1))
      fill_in 'image[name]', with: image_2.name
      fill_in 'image[url]', with: image_2.url

      click_on 'Update Image'

      expect(current_path).to eq(image_path(image_1))
      expect(page).to have_content(image_2.name)
    end
  end
end
