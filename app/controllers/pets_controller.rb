class PetsController < ApplicationController
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
    @pet = Pet.new(pet_params)
    @pet.save
  end

  def update
  end

  def delete
  end

  private

  def pet_params
    params.require(:pets).permit(:name, :city, :street, :zipcode, :kind, :description, :price)
  end
end
