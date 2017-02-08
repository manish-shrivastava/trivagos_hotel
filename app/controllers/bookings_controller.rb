class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hotel_category, only: [:new, :create, :available_rooms, :search_rooms]

  def new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
  end

  def index
    @bookings = current_user.bookings
  end

  # Method for available rooms view
  def available_rooms
    @booking = current_user.bookings.new(booking_params)
    @hotel_rooms = @hotel_category.hotel_rooms.available_rooms(params[:booking][:check_in], params[:booking][:check_out])
  end

  # Method for search rooms view
  def search_rooms
  end

  private

  def set_hotel_category
    @hotel_category = HotelCategory.find(params[:hotel_category_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :hotel_room_id)
  end
end
