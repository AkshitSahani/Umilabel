Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  devise_scope :user do
    get '/profile_setup', to: "users/registrations#profile_setup", as: 'profile_setup'
    patch '/create_profile', to: 'users/registrations#create_profile', as: 'create_profile'
    get '/edit_profile', to: "users/registrations#edit_profile", as: 'edit_profile'
    patch '/update_profile', to: "users/registrations#update_profile", as: 'update_profile'
    get '/users/:id', to: "users/registrations#show", as: 'user'
    get '/', to: 'users/sessions#index'
  end

  root 'users/sessions#index'

  resources :campaigns do
    resources :rewards
  end

  resources :pledges

  resources :subscriptions


  resources :charges

  resources :conversations

  resources :personal_messages

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
