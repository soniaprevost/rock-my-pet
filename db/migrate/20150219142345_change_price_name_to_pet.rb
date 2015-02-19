class ChangePriceNameToPet < ActiveRecord::Migration
  def change
    rename_column :pets, :price, :donate, :integer
  end
end
