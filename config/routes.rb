# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }
  end
  root to: 'homepage#index'
  get 'homepage/index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
