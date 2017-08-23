Rails.application.routes.draw do
  resources :studies do
    resources :channels, only: [:new, :create]
  end
  resources :channels, only: [:edit, :update, :destroy] do
    resources :messages, only: [:create, :destroy]
  end
  resources :subjects, only: [:new, :create]  # To allow the program to work outside the universities
  devise_for :users
  resources :users, only: [:show]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
