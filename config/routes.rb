Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :products

  resources :comments do
    resource :votes, only: :show
  end

  root 'products#index'
end
