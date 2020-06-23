# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Api::EventsController, type: :request do
  describe 'GET /api/events' do
    context 'when authorization is valid' do
      it 'returns events' do
        user = build :user
        sign_up(user)
        @tokens = auth_tokens_for_user(user)

        FactoryBot.create_list(:event, 10)
        get '/api/events', headers: @tokens

        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['response'].length).to eq(10)
      end

      # it 'returns status code 200' do
      #   expect(response).to have_http_status(200)
      # end
    end


    # it 'gets all events' do
    #   auth_tokens = sign_in(user)
    #   p auth_tokens
    #   FactoryBot.create_list(:event, 10)
    #
    #   get '/api/events'
    #   json = JSON.parse(response.body)
    #
    #   # リクエスト成功を表す200が返ってきたか確認する。
    #   expect(response.status).to eq(200)
    #
    #   # 正しい数のデータが返されたか確認する。
    #   expect(json['data'].length).to eq(10)
    end


  # describe 'GET /events' do
  #   it 'works! (now write some real specs)' do
  #     get events_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
