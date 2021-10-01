# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'
      post '/registeration', to: 'sessions#registeration'
      resources :todos do
        resources :items
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
