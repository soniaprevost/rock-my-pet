class ChangeZipcodeToPet < ActiveRecord::Migration
  def up
    change_column :pets, :zipcode, :string
  end

  def down
    change_column :pets, :zipcode, :integer
  end
end
