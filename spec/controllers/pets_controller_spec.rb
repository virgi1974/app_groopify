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

    describe "GET #new" do
      before(:each) do
        get :new
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

      it "renders the :new view" do
       expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        let!(:pet) { FactoryGirl.attributes_for(:pet, name: "caniche", race: "chihuaha", age: 33) }
          it "creates a new pet" do
            expect{
              post :create, pet: FactoryGirl.attributes_for(:pet)
            }.to change(Pet,:count).by(1)
          end
          
          it "redirects to the pet index page" do
            post :create, pet: FactoryGirl.attributes_for(:pet)
            expect(response.location).to match('/pets')
          end
      end
      
      context "with invalid attributes" do
        it "does not save the new pet" do
          expect{
            post :create, pet: FactoryGirl.attributes_for(:pet, name: nil, race: "chihuaha", age: 33)
          }.to_not change(Pet,:count)
        end
        
        # it "re-renders the new pets view" do
        #   post :create, pet: FactoryGirl.attributes_for(:pet)
        #   expect(subject).to render_template("pets/new")
        # end
      end 
    end

    describe 'PUT #update' do
      # before :each do
      #   @pet = FactoryGirl(:pet, name: "random name", race: "random race", age: 2)
      #   post :update

      #   # pet.title = "new title"
      #   # pet.body = "new race"
      #   # pet.age = 6
      # end
      
      # context "valid attributes" do
      #   it "located the requested @pet" do
      #     # binding.pry
      #     # @pet = Factory(:pet, title: "new title", body: "new body content for the article")
      #     put :update, id: @pet, pet: FactoryGirl.attributes_for(:pet)
      #     assigns(:pet).should eq(@pet)      
      #   end
    
        # it "changes @contact's attributes" do
        #   put :update, id: article, 
        #     contact: FactoryGirl.attributes_for(:article, title: "new title", body: "new body content for the article")
        #   @contact.reload
        #   @contact.firstname.should eq("new title")
        #   @contact.lastname.should eq("new body content for the article")
        # end
    
        # it "redirects to the updated contact" do
        #   put :update, id: @contact, contact: Factory.attributes_for(:contact)
        #   response.should redirect_to @contact
        # end
      # end
      
      # context "invalid attributes" do
      #   it "locates the requested @contact" do
      #     put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
      #     assigns(:contact).should eq(@contact)      
      #   end
      
      #   it "does not change @contact's attributes" do
      #     put :update, id: @contact, 
      #       contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: nil)
      #     @contact.reload
      #     @contact.firstname.should_not eq("Larry")
      #     @contact.lastname.should eq("Smith")
      #   end
      
      #   it "re-renders the edit method" do
      #     put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
      #     response.should render_template :edit
      #   end
      # end

    end

    describe 'DELETE destroy' do
      before :each do
        @pet = FactoryGirl.create(:pet)
      end

      it "deletes the contact" do
        expect{
          delete :destroy, id: @pet.id        
        }.to change(Pet,:count).by(-1)
      end
        
      it "redirects to pets#index" do
        delete :destroy, id: @pet.id 
        response.should redirect_to pets_url
      end
    end

  end
end
