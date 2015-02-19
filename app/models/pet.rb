class Pet < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :bookings, dependent: :destroy
  extend Enumerize

  validates :name, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true, length: { maximum: 5 }
  enumerize :kind, in: %w(dog hamster cat guinea_pig).sort
  validates :description, presence: true
  validates :donate, presence: true, numericality: {greater_than: 0}
  validates :needs, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    "#{street} #{zipcode} #{city}"
  end

  def address_changed?
    street_changed? || zipcode_changed? ||city_changed?
  end

  def available?(booking)
    output = true
    bookings.each do |b|
      if (b.checkin <= booking.checkout && b.checkout >= booking.checkin)
        output = false
      end
    end
    output
  end
end
