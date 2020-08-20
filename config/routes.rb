Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :goats do
    resources :rentals, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :users, only: [:show]
end
