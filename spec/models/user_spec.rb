require 'rails_helper'

describe User, type: :model do
  context "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
  end
end

describe User, type: :model do
  describe "validates" do
    it "presence of username" do
      user = create(:user)

      expect(user).to_not be_valid
    end

    it "uniqueness of email" do
      original = create(:user)
      copy_cat = create(:user)

      expect(original).to be_valid
      expect(copy_cat).to_not be_valid
    end
  end
end

describe "roles" do
  it "can be created as an admin" do
    admin = create(:admin)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = create(:user)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
