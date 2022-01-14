Rails.application.routes.draw do
  root 'welcome#index'

  resources :comments do
    resource :votes, only: :show
  end
  
  devise_for :users
end
