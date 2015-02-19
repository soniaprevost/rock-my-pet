class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:booking][:pet_id])
    if @pet.available?(@booking)
      @booking.pet = @pet
      @booking.walker = current_user
      if @booking.save
        redirect_to account_path
      else
        flash.now[:alert] = "Try again!"
        render :new
      end
    else
      flash.now[:alert] = "Sorry this pet is unavailable for this period :("
    end
  end

  def update
    @booking = Booking.find(params[:booking][:id])
    @booking.update(booking_params)
    @booking.pet.available = false
    @booking.pet.save
  end


  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :accept)
  end

  def find_pet
    @pet = Pet.find(params[:pet][:id])
  end
end
