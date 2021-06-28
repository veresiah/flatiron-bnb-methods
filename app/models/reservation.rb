class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review

  validates :checkin, :checkout, presence: true

  def duration
    (checkout - checkin).to_i
  end

  def total_price
    listing.price * duration
  end
end

