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

  def destroy
    @pet = Pet.find(params[:id])
    
    if @pet.destroy
      flash[:notice] = "User was successfully deleted"
    else
      flash[:error]  = "Cannot delete current admin"
    end
    redirect_to pets_path
  end

  def edit
    @pet = Pet.find(params[:id]) 
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pets_path
    else
      render :edit
    end  
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :race, :age, :avatar)
    end

end