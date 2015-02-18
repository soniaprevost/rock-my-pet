class PetsController < ApplicationController
  # TODO skip authentications

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
