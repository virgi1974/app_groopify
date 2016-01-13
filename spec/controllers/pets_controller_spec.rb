require 'pry'
require 'test_helper'
require 'rails_helper'
require 'spec_helper'

class PetsControllerTest < ActionController::TestCase

  RSpec.describe PetsController, type: :controller do  
    let(:pet) { FactoryGirl.create(:pet) }

    describe "GET #index" do
      before(:each) do
        get :index
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
        get :index
        assigns(:pets).should eq([pet])
      end

    end
  end #RSpec
end #UsersControllerTest

