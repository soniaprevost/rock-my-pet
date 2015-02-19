class Booking < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User", foreign_key: :user_id

  def total_price(booking)
    @number_of_days = (booking.checkout - booking.checkin).to_i
    return @total_price = @number_of_days * booking.pet.donate
  end
end
