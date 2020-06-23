# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Api::EventsController, type: :request do

  # 毎回繰り返されてしまうので、一度だけのリクエストにしたい
  before :all  do
    # @userにはuser_infoでidを取得して代入。きれいではないが、ひとまず想定している動きをしている
    @user = build :user
    sign_up(@user)
    @tokens = auth_tokens_for_user(@user)
    user_data = user_info(@tokens)
    @user.id = user_data['id']
  end

  # TODO, authorizedの場合
  # TODO, authorizedがダメな場合
  # TODO, user_idが一致している場合

  context 'when authorization is valid' do
    # index
    it 'returns events' do
      FactoryBot.create_list(:event, 10)
      get '/api/events', headers: @tokens
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json['response'].length).to eq(10)
    end

    # show
    it 'returns an event' do
      event = create(:event, title: 'event-title')
      get "/api/events/#{event.id}", headers: @tokens
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['response']['title']).to eq(event.title)
    end

    # post
    it 'can post an event' do
      event = build :event
      expect { post '/api/events', params: { event: event }, headers: @tokens, as: :json }.to change(Event, :count).by(+1)
      expect(response.status).to eq(200)
    end

    # update
    it 'can edit an event' do
      event = create(:event, title: 'old-title', user_id: @user.id)
      event.title = 'new-title'
      put "/api/events/#{event.id}", params: { event: event }, headers: @tokens, as: :json
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['response']['title']).to eq('new-title')
    end

    # delete
    it 'can delete an event' do
      event = create(:event, user_id: @user.id)
      expect { delete "/api/events/#{event.id}", headers: @tokens, as: :json }.to change(Event, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end

  context 'when authorization is invalid' do

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
