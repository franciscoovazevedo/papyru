Rails.application.routes.draw do

  resources :notifications, only: [:index]
  resources :studies do
    resources :channels, only: [:new, :create]
  end
  resources :channels, only: [:edit, :update, :destroy, :show] do
    resources :messages, only: [:new, :create, :destroy] do
      resources :notifications, only: [:new, :create]
    end
  end
  resources :subjects, only: [:new, :create]  # To allow the program to work outside the universities
  devise_for :users
  resources :users, only: [:show]

  root to: 'pages#home'
  get 'help', to: 'pages#help'

  get 'about_us', to: 'pages#about_us'
  get 'why_papyru', to: 'pages#why_papyru'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
