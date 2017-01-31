Rails.application.routes.draw do

  root "home#index"
  resources :home, only: [:index]

  devise_for :users

  resources :users, only: [:index, :show]

  resources :events do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
