require 'sidekiq/web'

Rails.application.routes.draw do
  resources :books do                                         #restful routes and inside it add more that aren't restful
    member do
      put "add", to: "books#library"
      put "remove", to: "books#library"
    end
  end
  resources :library, only:[:index]
  resources :pricing, only:[:index]
  devise_for :users, controller: { registrations: "registrations"}
  root to: 'books#index'
  resources :subscriptions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
