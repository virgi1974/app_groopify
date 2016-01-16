require 'test_helper'
require 'rails_helper'
require 'spec_helper'
require 'pry'


RSpec.describe UsersController, type: :routing do
  it "routes to #welcome" do
    expect(get: "/").to route_to("users#welcome")
  end
end

RSpec.describe PetsController, type: :routing do
  it "routes to #index" do
    expect(get: "/pets").to route_to("pets#index")
  end
  # it "routes to #show" do
  #   expect(get: "/pets/3").to route_to("pets#show")
  # end
  it "routes to #new" do
    expect(get: "/pets/new").to route_to("pets#new")
  end
  it "routes to #create" do
    expect(post: "/pets").to route_to("pets#create")
  end
  # it "routes to #destroy" do
  #   expect(delete: "/pets/3").to route_to("pets#destroy")
  # end
  # it "routes to #edit" do
  #   expect(get: "/pets/4/edit").to route_to("pets#edit")
  # end
  # it "routes to #create" do
  #   binding.pry
  #   expect(patch: "/pets/4").to route_to("pets#update")
  # end
  
end