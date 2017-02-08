module Api
  module V1
    class BookingInformationsController < Api::AuthenticationController
      
      def index
      	render json: current_user.bookings
      end
    end
  end
end