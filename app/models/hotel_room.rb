# == Schema Info
#
# Table name: hotel_rooms
#
# id                         :integer(11), not null, primary key
# name                       :string
# max_adults                 :integer(11)
# max_children               :integer(11)
# hotel_category_id          :integer(11)
# created_at                 :datetime, not null
# updated_at                 :datetime, not null

class HotelRoom < ApplicationRecord
  # adding belongs to relationship with hotel_category
  belongs_to :hotel_category
  # has_many relationship with the bookings
  # fetching all the bookings of the hotel room
  has_many :bookings

  # Scope for checking if any of the rooms are available or not
  scope :available?, -> (check_in, check_out=nil) { available_rooms(check_in, check_out).present? }

  # Scope for finding all the available rooms
  scope :available_rooms, -> (check_in, check_out=nil) { 
    check_out = check_in if check_out.nil?
  	# Fetching all the booked rooms in the particular date range 
  	hotel_rooms = includes(:bookings=>:booking_dates).where("booking_dates.reserved_date": check_in..check_out)
  	# Filtering all the booked rooms and finding out the available rooms for particular
  	where.not(id: hotel_rooms.map(&:id))
  }

  # These attributes should always be present
  validates :name, :max_adults, :max_children, :hotel_category_id, presence: true

  # Checking if particular room is avaliable or not
  def available?(check_in, check_out=nil)
    check_out = check_in if check_out.nil?
  	# we are also able to search for one day booking 
  	# dates we are taking as yyyy/mm/dd
  	# example available("2016/10/9")
  	# example available("2016/10/2","2016/10/9")
  	# searching bookings using check_in and check_out date range
  	bookings.joins(:booking_dates).where("booking_dates.reserved_date": check_in..check_out).blank?
  end
end