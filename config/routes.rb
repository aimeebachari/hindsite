Rails.application.routes.draw do

  root "home#index"
  resources :home, only: [:index]

  devise_for :users

  resources :users, only: [:index, :show]

  resources :events do
    resources :reviews
  end

  resources :reviews

  resources :trips

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:create]
    end
  end
end
