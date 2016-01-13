class PetsController < ApplicationController

  before_action :authenticate_user!

  def index
    @pets = Pet.all
    render 'index'
  end

  def show
    @pet = Pet.find_by(id: params[:id])
      if @pet
        render json: @pet
      else
        render json: {error: "Pet not found"},status: 404
      end
  end

end