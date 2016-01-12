require 'spec_helper'
require 'test_helper'
require 'pry'
require 'rails_helper'

RSpec.describe User, type: :model do   

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_truthy
  end

  describe "validatons" do 
    it "is invalid without a name" do
      expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
    end
    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end 
    it "is invalid without a password_confirmation" do
      expect(FactoryGirl.build(:user, password_confirmation: nil)).to_not be_valid
    end 
    it "has a unique email" do
      user1 = FactoryGirl.create(:user,email: "Random2015@random.com")
      user2 = FactoryGirl.build(:user,email: "Random2015@random.com")
      expect(user2.save).to be_falsey
    end
    it "password and password_confirmation must match" do
      user = FactoryGirl.build(:user,password: "Random2015@random.com",password_confirmation: "Random2015@random.com")
      expect(user.save).to be_falsey
    end
  end

  describe "user relations" do
    it "should have many pets" do
      user = User.reflect_on_association(:pets)
      user.macro.should == :has_many
    end
  end

end





