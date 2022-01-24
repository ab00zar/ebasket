# frozen_string_literal: true

Rails.application.routes.draw do
  resources :discounts
  devise_for :users
  resources :items
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
