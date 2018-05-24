require 'rails_helper'

describe 'user delete option' do
  it 'should allow user to update an existing image' do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    image_1 = create(:image, name: 'pie', url: 'https://www.instagram.com/p/BjIv6Q_Fe43/?explore=true')
    image_2 = create(:image, name: 'cake', url: 'https://www.instagram.com/p/BjHoaP1Fasq/?explore=true')

    visit user
  end
end
