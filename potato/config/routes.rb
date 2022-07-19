Rails.application.routes.draw do
  resources :baskets
  resources :consumers
  resources :farmers
  resources :areas
  root 'sessions#index'

  get 'profile' => 'sessions#profile', :as => 'profile'

  post 'sign-in' => 'sessions#sign_in', :as => 'sign-in'
  post 'message' => 'sessions#message', :as => 'message'
  post 'sign-out' => 'sessions#sign_out', :as => 'sign-out'

  post 'current-known-gid' => 'sessions#getgid'

  resources :users
  resources :sessions
end
