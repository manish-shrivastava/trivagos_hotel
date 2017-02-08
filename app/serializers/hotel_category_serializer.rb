class HotelCategorySerializer < ActiveModel::Serializer 
  attributes :id, :name, :price, :available_rooms_count, :hotel_rooms

  def available_rooms_count
  	object.hotel_rooms.count
  end

  # hotel_rooms method for fetching available rooms
  def hotel_rooms
  	object.available_hotel_rooms @instance_options[:check_in], @instance_options[:check_out]
  end

  has_many :hotel_rooms
end