require 'sidekiq/web'

Rails.application.routes.draw do
  resources :books
  resources :library, only [:index]
  devise_for :users
  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
