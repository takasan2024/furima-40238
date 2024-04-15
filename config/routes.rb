Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"
  resources :items, only: [:new ,:create] do
    resources :buyers, only: :create
end
resources :users
end