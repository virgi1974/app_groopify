require 'pry'

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

  def new
    @pet = current_user.pets.new 
    render 'new'
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      flash[:notice] = 'Pet created successfully!'
      redirect_to action: 'index', controller: 'pets', id: current_user.id
    else
      flash[:alert] = 'Pet creation failed!'
      render 'new'
    end
  end

  # def destroy
  # end

  # def update
  # end

  private
    def pet_params
      params.require(:pet).permit(:name, :race, :age)
    end

end