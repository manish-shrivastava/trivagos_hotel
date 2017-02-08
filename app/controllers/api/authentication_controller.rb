module Api
  class AuthenticationController < BaseController
    acts_as_token_authentication_handler_for User
  end
end