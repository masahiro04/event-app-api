# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # 200 Success
  def response_success(response)
    render status: :ok, json: { response: response }
  end

  # 400 Bad Request
  def response_bad_request
    render status: :bad_request, json: { status: 400, message: 'Bad Request' }
  end

  # 401 Unauthorized
  def response_unauthorized
    render status: :unauthorized, json: { status: 401, message: 'Unauthorized' }
  end

  # 404 Not Found
  def response_not_found(class_name = 'page')
    render status: :not_found, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
  end

  # 409 Conflict
  def response_conflict(class_name)
    render status: :conflict, json: { status: 409, message: "#{class_name.capitalize} Conflict" }
  end

  # 422 Conflict
  def response_unprocessable_entity(class_name)
    render status: :unprocessable_entity, json: { status: 422, message: "#{class_name.capitalize} Unprocessable Entity" }
  end

  # 500 Internal Server Error
  def response_internal_server_error
    render status: :internal_server_error, json: { status: 500, message: 'Internal Server Error' }
  end
end
