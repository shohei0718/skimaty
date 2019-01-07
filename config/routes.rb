Rails.application.routes.draw do
  devise_for :users

  root 'lectures#index'

  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :lectures do
    member do
      post 'pay'
    end
  end
end
