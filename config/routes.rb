# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: 'json' do
    resources :items, only: %i[index update]
    resources :payments, only: [:create]
    resources :orders, only: [:create]
  end
end
