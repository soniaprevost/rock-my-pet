class Booking < ActiveRecord::Base
  belongs_to :pet
  belongs_to :walker, class_name: "User", foreign_key: :user_id
end
