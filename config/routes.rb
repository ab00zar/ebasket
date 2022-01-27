# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'items#index'

  resources :discounts

  devise_for :users

  resources :items do
    collection do
      get ':id/add_to_basket' => 'items#add_to_basket'
    end
  end
end
