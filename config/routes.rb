Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  get "/users/:id/profile", to: "users#show"

  get "/users", to: 'users#index'

  resources :followers, only: [:create, :destroy]

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
