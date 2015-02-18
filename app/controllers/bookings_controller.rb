class BookingsController < ApplicationController
  before_action :find_pet, only: [:new, :create]
  before_action :authenticate_user!


  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.walker = current_user
    if @booking.save
      redirect_to account_path
    else
      flash.now[:alert] = "Try again!"
      render :new
    end
  end

private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end
end
