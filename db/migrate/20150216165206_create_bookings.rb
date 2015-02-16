class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.boolean :accept
      t.references :pet, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookings, :pets
    add_foreign_key :bookings, :users
  end
end
