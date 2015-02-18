class AddCheckinCheckoutToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :checkin, :date
    add_column :bookings, :checkout, :date
  end
end
