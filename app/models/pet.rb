class Pet < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :bookings, dependent: :destroy
  extend Enumerize

  validates :name, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  enumerize :kind, in: %w(dog hamster cat guinea_pig).sort
  validates :description, presence: true
  validates :price, presence: true, numericality: {only_integer: true}

end
