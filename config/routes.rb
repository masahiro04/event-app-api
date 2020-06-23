# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }
    resources :events
    resources :users, only: %i[index], shallow: true do
      collection do
        get :user_info_by_token
      end
    end
  end
  root to: 'homepage#index'
  get 'homepage/index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
