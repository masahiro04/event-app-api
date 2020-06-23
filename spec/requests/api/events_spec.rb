# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Api::EventsController, type: :request do

  before do
    user = build :user
    sign_up(user)
    @tokens = auth_tokens_for_user(user)
  end

  context 'when authorization is valid' do
    it 'returns events' do
      FactoryBot.create_list(:event, 10)
      get '/api/events', headers: @tokens

      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json['response'].length).to eq(10)
    end

    it 'returns status code 200' do
      get '/api/events', headers: @tokens
      expect(response).to have_http_status(200)
    end
  end

  context 'when authorization is invalid' do
    it 'does not returns events' do
      FactoryBot.create_list(:event, 10)
      get '/api/events', headers: nil

      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json['errors']).to eq(["You need to sign in or sign up before continuing."])
    end

    it 'returns status code 401' do
      get '/api/events', headers: nil
      expect(response).to have_http_status(401)
    end
  end
end
