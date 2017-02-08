module Api
  module V1
    class SessionsController < DeviseController
      skip_before_filter :verify_authenticity_token, :only => :create

      prepend_before_filter :require_no_authentication, :only => [:create ]
      
      before_filter :ensure_params_exist

      respond_to :json
      
      def create
        resource = User.find_for_database_authentication(:email=>params[:user][:email])
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:user][:password])
          sign_in("user", resource)
          render :json=> resource 
          return
        end
        invalid_login_attempt
      end
      
      def destroy
        sign_out(resource_name)
      end

      protected

      def ensure_params_exist
        return unless params[:user].blank?
        render :json=>{:success=>false, :message=>"missing user parameter"}, :status=>422
      end

      def invalid_login_attempt
        warden.custom_failure!
        render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
      end
    end
  end
end