class Booking < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User", foreign_key: :user_id
  after_update :update_pet_status

  private
  def update_pet_status
    self.pet.update_attributes(available: false) if self.accept
  end
end
