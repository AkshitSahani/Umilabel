Rails.application.routes.draw do

  root 'sessions#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :campaigns do
    resources :rewards
  end

  resources :pledges

  resources :subscriptions

  resources :users

  get '/new_profile' => "users#new_profile", as: :new_profile
  post '/create_profile' => 'users#create_profile', as: :create_profile

  resources :charges

  resources :conversations

  resources :personal_messages

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
