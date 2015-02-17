class PetsController < ApplicationController
  before_action :find_pet, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)
    @pet.save

    redirect_to pet_path(@pet)
  end

  def edit
  end

  def update
    @pet.update(pet_params)

    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy

    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :city, :street, :zipcode, :kind, :description, :price)
  end

  def find_pet
    @pet = current_user.pets.find(params[:id])
  end

end
