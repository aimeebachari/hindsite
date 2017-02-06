Rails.application.routes.draw do

  root "home#index"
  resources :home, only: [:index]

  devise_for :users

  resources :users, only: [:index, :show]

  resources :events do
    resources :reviews
  end

  resources :reviews do
    resources :comments
  end
  
  resources :trips
end
