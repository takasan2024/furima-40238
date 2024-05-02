Rails.application.routes.draw do
   devise_for :users
  root to: "items#index"
  
  resources :items, only: [:index, :new, :create, :update] do
    collection do
      get 'get_category_child', to: 'items#get_category_child', defaults: { format: 'json' }
      get 'get_category_grandchild', to: 'items#get_category_grandchild', defaults: { format: 'json' }
    end
  end
end
