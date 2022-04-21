Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  devise_for :users
  root to:"items#index"
  resources :items
end
