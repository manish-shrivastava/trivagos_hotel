module Api
  module V1
    class RegistrationsController < DeviseController
      skip_before_filter :verify_authenticity_token, :only => :create
      respond_to :json
      def create
        user = User.new(sign_up_params)
        if user.save
          render :json=> user, :status=>201
          return
        else
          warden.custom_failure!
          render :json=> { status: false, message: user.errors}, :status=>422
        end
      end

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up)
      end

      def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :mobile, :password)
      end
    end
  end
end