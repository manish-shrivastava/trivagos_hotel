# == Schema Info
#
# Table name: bookings
#
# id                         :integer(11), not null, primary key
# check_in                   :date
# check_out                  :date
# hotel_room_id              :integer(11)
# user_id                    :integer(11)
# created_at                 :datetime, not null
# updated_at                 :datetime, not null

class Booking < ApplicationRecord
  # including validation methods
  include BookingValidations
  # callback to save booking dates with in booking dates table
  after_save :create_or_update_booking_dates
  # adding belongs to relationship with hotel_room
  belongs_to :hotel_room
  # adding belongs to relationship with user
  belongs_to :user
  # added has_many relationship with booking_dates
  has_many :booking_dates, dependent: :destroy

  # These attributes should always be present
  validates :check_in, :check_out, :hotel_room_id, :user_id, presence: true

  # Custom valudation for check in date
  # Check in date cannot be in the past
  validate :check_in_cannot_be_in_the_past

  # Custom valudation for check out date
  # Check out date should not be less than check in date
  validate :check_out_should_be_less_than_check_in

  # Custom Validation for limiting the booking for 6 months
  # Allows booking up to 6 months in advance for room reservations
  validate :check_out_cannot_be_more_than_6_months

  # Checking the hotel room availability
  validate :room_availability_check
end