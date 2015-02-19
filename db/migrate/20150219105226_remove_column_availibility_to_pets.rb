class RemoveColumnAvailibilityToPets < ActiveRecord::Migration
  def self.up
    remove_column :pets, :available
  end

  def self.down
    add_column :pets, :available, :boolean
  end
end
