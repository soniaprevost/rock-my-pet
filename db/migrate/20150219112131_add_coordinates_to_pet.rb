class AddCoordinatesToPet < ActiveRecord::Migration
  def change
    add_column :pets, :latitude, :float
    add_column :pets, :longitude, :float
  end
end
