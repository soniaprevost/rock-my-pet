class AddDefaultAcceptToBookings < ActiveRecord::Migration
  def up
    change_column :bookings, :accept, :boolean, default: false
  end

  def down
    change_column :bookings, :accept, :boolean, default: nil
  end
end
