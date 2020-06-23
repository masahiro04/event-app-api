# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :authenticate_api_user!

    def index
      begin
        # userリストを表示することを想定
        response_success([])
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end

    def user_info_by_token
      begin
        response_success(current_api_user)
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end
  end
end
