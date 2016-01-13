require 'spec_helper'
require 'test_helper'
require 'pry'
require 'rails_helper'

RSpec.describe Pet, type: :model do  
  before(:all) do
    Pet.destroy_all
  end 

  it "has a valid factory" do
    expect(FactoryGirl.build(:pet)).to be_truthy
  end

  describe "validatons" do 
    it "is invalid without a name" do
      expect(FactoryGirl.build(:pet, name: nil)).to_not be_valid
    end
    it "is invalid without the race" do
      expect(FactoryGirl.build(:pet, race: nil)).to_not be_valid
    end
    it "is invalid without age" do
      expect(FactoryGirl.build(:pet, age: nil)).to_not be_valid
    end 
  end

  describe "pet relations" do 
    it "should have only one user" do
      # pet = Pet.reflect_on_association(:users)
      # binding.pry
      # pet.macro.should == :belongs_to
    end
  end


end





