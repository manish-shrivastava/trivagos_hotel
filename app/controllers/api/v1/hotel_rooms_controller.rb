module Api
  module V1
    class HotelRoomsController < Api::BaseController
      
      def index
      	# finding out particular category
      	hotel_category = HotelCategory.where(id: params[:category_id])
      	# Serving the appropriate response by specific or all category 
      	# Also we are showing rooms availability as per check_in and check_out time
        render :json => (hotel_category.blank? ? HotelCategory.all : hotel_category), check_in: params[:check_in], check_out: params[:check_out]
      end
    end
  end
end