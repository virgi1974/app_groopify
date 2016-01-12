require 'spec_helper'
require 'test_helper'
require 'pry'
require 'rails_helper'

RSpec.describe User, type: :model do   

  # it "has a valid factory"
  # it "is invalid without a firstname"
  # it "is invalid without a lastname"
  # it "returns a contact's full name as a string"
  # before(:all) do
  #   Article.destroy_all
  # end

    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_truthy
    end

  #  describe "validatons" do 
  #   it "is invalid without a title" do
  #     expect(FactoryGirl.build(:article, title: nil)).to_not be_valid
  #   end
  #   it "is invalid without a body" do
  #     expect(FactoryGirl.build(:article, body: nil)).to_not be_valid
  #   end 
  #   it "has a unique title" do
  #     article1 = FactoryGirl.create(:article,title: "random")
  #     article2 = FactoryGirl.build(:article,title: "random")
  #     expect(article2.save).to be_falsey
  #     # expect(article2.saveerrors.full_messages[0]).to eq("Title has already been taken")
  #   end
  #   it "fails with a body of less than 20 chars" do
  #     article = FactoryGirl.build(:article,body: "body content")
  #     expect(article.save).to be_falsey
  #   end
  #   it "passes with a body of more than 20 chars" do
  #     article = FactoryGirl.build(:article,body: "long long long long body content")
  #     expect(article.save).to be_truthy
  #   end
  # end

end






