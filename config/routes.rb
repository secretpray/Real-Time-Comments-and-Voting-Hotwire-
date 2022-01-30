Rails.application.routes.draw do
  root 'products#index'

  resources :categories
  resources :products

  resources :comments do
    resource :votes, only: :show
  end

  devise_for :users
end
