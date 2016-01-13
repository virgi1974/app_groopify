require 'pry'
require 'test_helper'
require 'rails_helper'
require 'spec_helper'

class PetsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
 
  RSpec.describe PetsController, type: :controller do 
    let(:pet) { FactoryGirl.create(:pet) }
    login_user

    describe "GET #index" do
      before(:each) do
        get :index
      end
      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "responds successfully" do
        expect(response).to be_success
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        expect(response).to render_template(:index)
      end
      it "gets all the pets" do
        assigns(:pets).should eq([pet])
      end
    end

    describe "GET #show" do
      before(:each) do
        get :show, id:pet.id
        @data = JSON.parse(response.body)
      end
      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "responds successfully" do
        expect(response).to be_success
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it 'responds without error' do
        expect {@data}.to_not raise_error
      end
      it 'responds with JSON' do
        expect(response.header['Content-Type']).to include 'application/json'
      end
      it "the returned json-map has 12 fields" do
        expect(@data.entries.count).to eq(7)
      end
    end

    describe "GET #show_selected_map" do
     
    end

  end
  
end
