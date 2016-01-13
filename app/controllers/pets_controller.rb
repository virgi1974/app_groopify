class PetsController < ApplicationController

  before_action :authenticate_user!

  def index
    @pets = Pet.all
  end
end
