class PetsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pets = Pet.all

    @markers = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    @pet_coordinates = { latitude: @pet.latitude, longitude: @pet.longitude}

    @marker = Gmaps4rails.build_markers(@pet) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
    end
  end
end
