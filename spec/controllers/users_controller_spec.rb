require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #—skip-test-unit" do
    it "returns http success" do
      get :—skip-test-unit
      expect(response).to have_http_status(:success)
    end
  end

end
