class Pet < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :bookings

  validates :name, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :kind, inclusion: {in: ["cat", "dog", "hamster"], allow_nil: false}
  validates :description, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
end
