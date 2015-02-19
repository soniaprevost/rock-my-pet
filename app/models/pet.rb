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

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def available?(booking)
    @bookings = self.bookings
    @checkins = @bookings.map { |booking| booking.checkin}
    @checkouts = @bookings.map { |booking| booking.checkout}
    if @checkins.include? booking.checkin || @checkouts.include? booking.checkout

  end
end
