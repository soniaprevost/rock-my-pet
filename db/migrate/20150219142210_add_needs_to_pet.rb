class AddNeedsToPet < ActiveRecord::Migration
  def up
    add_column :pets, :needs, :string
  end

  def down
    add_column :pets, :needs, :string
  end
end
