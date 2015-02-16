class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :city
      t.string :street
      t.integer :zipcode
      t.string :kind
      t.text :description
      t.integer :price
      t.boolean :available

      t.timestamps null: false
    end
  end
end
