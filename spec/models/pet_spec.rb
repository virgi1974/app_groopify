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

  describe "validations" do 
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
  describe "PAPERCLIP" do
    before(:all) do
     @avatar = File.new("#{Rails.root}/spec/factories/images/superman.png")
    end 
    context "validation ok" do
      it "validates presence attachment file  --> valid" do
        expect(FactoryGirl.build(:pet, avatar: @avatar)).to be_valid
      end
      it "content of the avatar.avatar_file_name as expected" do
        @pet = FactoryGirl.build(:pet, avatar: @avatar)
        expect(@pet.avatar_file_name).to eq('superman.png')
      end
      it "validates content-type  --> valid" do
       @pet = FactoryGirl.build(:pet, avatar: @avatar)
       expect(@pet.avatar_content_type).to include('image')
      end
    end
    context "validation NOT ok" do
      it "validates presence attachment file  --> no valid" do
        expect(FactoryGirl.build(:pet, avatar: nil)).to_not be_valid
      end
      it "validates content-type  --> no valid" do
        @pet = FactoryGirl.build(:pet, avatar: @avatar)
        expect(@pet.avatar_content_type).to_not include('.pdf')
      end
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





