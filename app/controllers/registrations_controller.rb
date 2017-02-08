class RegistrationsController < Devise::RegistrationsController

  private

  # Sign up params for creating user
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation)
  end

  # Accoung update params required while updating a user
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation, :current_password)
  end
end