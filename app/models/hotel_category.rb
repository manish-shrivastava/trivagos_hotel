# == Schema Info
#
# Table name: hotel_categories
#
# id                         :integer(11), not null, primary key
# name                       :string
# price                      :decimal, precision(8), scale(2)
# created_at                 :datetime, not null
# updated_at                 :datetime, not null

class HotelCategory < ApplicationRecord
  # adding has_many relationship with hotel_rooms
  # A hotel category can have multiple rooms
  has_many :hotel_rooms, dependent: :destroy
  # These attributes should always be present
  validates :name, :price, presence: true

  # Method for checking available rooms for particualr category
  def available_hotel_rooms check_in, check_out=nil
  	hotel_rooms.available_rooms check_in, check_out
  end

  def sort_name
  	name.split("-")[0]
  end
end