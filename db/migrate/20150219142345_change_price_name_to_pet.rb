class ChangePriceNameToPet < ActiveRecord::Migration
  def up
    rename_column :pets, :price, :donate
  end

  def down
    rename_column :pets, :donate, :price
  end
end
