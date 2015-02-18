class Accounts::BookingsController < ApplicationController

  def index
    # on veut les reservations faites sur nos pets
    # dans la view current_user.pets.each {|p| p.bookings }
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

end
