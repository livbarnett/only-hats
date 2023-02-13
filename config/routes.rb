Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "pages/profile", to: "pages#profile"

  # resources :bookings, except: %i[create]
  resources :hats, only: %i[new create edit update index show] do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[index] do
    resources :reviews, only: %i[new create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
