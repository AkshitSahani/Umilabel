Rails.application.routes.draw do

  root 'sessions#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :campaigns do
    resources :rewards
  end

  resources :pledges

  resources :subscriptions

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
