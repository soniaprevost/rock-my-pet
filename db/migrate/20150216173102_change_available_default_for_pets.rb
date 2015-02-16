class ChangeAvailableDefaultForPets < ActiveRecord::Migration
  def up
    change_default :pets, :available, true
  end

  def down
    change_default :pets, :available, nil
  end
end
