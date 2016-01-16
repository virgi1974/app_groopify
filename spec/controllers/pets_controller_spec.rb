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
      it "the returned pet has 12 fields" do
        # expect(@data.entries.count).to eq(7)

        # paperclip adds 4 avatar fields to the model
        expect(@data.entries.count).to eq(11)

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
          it "redirects to the pet index page" do
            Post.should_receive(:save_attached_files).and_return(true)
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
      before(:each) do
        @pet = FactoryGirl.create(:pet)
      end
      
      context "valid attributes" do
        let(:attr) do 
          {name: 'new name', race: 'new race', age: 3 }
        end
        before(:each) do
          put :update, id: @pet.id, pet: attr
          @pet.reload
        end
        
        it "redirects to /pets"  do
          response.should redirect_to(:pets) 
        end
        it "attr name updated"  do
          expect(@pet.name).to eql(attr[:name])
        end
        it "attr name updated checked againstd the db"  do
          expect(Pet.last.name).to eql(attr[:name])
        end
        it "attr race updated"  do
          expect(@pet.race).to eql(attr[:race])
        end
        it "attr race updated checked againstd the db"  do
          expect(Pet.last.race).to eql(attr[:race])
        end
        it "attr age updated"  do
          expect(@pet.age).to eql(attr[:age])
        end
        it "attr age updated checked againstd the db"  do
          expect(Pet.last.age).to eql(attr[:age])
        end
      end
      
      context "invalid attributes" do
        let(:attr) do 
          {name: 'new name2', race: nil, age: nil }
        end
        before(:each) do
          put :update, id: @pet.id, pet: attr
          @pet.reload
        end

        it "renders /edit"  do
          expect(subject).to render_template("pets/edit")
        end
        it "attr race is not updated"  do
          expect(@pet.race).to_not eql(attr[:race])
        end
        it "attr race is not updated"  do
           expect(Pet.last.race).to_not eql(attr[:race])
        end
        it "attr name is not updated"  do
          expect(@pet.name).to_not eql(attr[:name])
        end
        it "attr name is not updated"  do
           expect(Pet.last.name).to_not eql(attr[:name])
        end
        it "attr age is not updated"  do
          expect(@pet.age).to_not eql(attr[:age])
        end
        it "attr age is not updated"  do
           expect(Pet.last.age).to_not eql(attr[:age])
        end
      
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
      end

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
