# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    render json: { response: 'success' }
  end
end
