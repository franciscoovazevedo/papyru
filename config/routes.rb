Rails.application.routes.draw do

  get 'notifications/show'

  get 'notifications/index'

  get 'notifications/destroy'

  resources :studies do
    resources :channels, only: [:new, :create]
  end
  resources :channels, only: [:edit, :update, :destroy, :show] do
    resources :messages, only: [:new, :create, :destroy]
  end
  resources :subjects, only: [:new, :create]  # To allow the program to work outside the universities
  devise_for :users
  resources :users, only: [:show]

  root to: 'pages#home'
  get 'help', to: 'pages#help'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
