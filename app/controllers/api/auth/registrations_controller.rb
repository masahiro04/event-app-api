# frozen_string_literal: true

module Api
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController

      private

      def sign_up_params
        params.permit(:name, :email, :favorite_phrase, :password, :password_confirmation)
      end

      def account_update_params
        params.permit(:name, :email, :favorite_phrase, :password, :password_confirmation)
      end

    end
  end
end
