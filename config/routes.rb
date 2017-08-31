Rails.application.routes.draw do

  post 'studies/upload_students', to: "studies#add_students_to_study" #member this TODO
  resources :notifications, only: [:index]  do
    member do
      patch 'change_status'
    end
    collection do
      get 'archive'
    end
  end
  resources :studies do
    resources :channels, only: [:new, :create]
  end
  resources :channels, only: [:edit, :update, :destroy, :show] do
    resources :messages, only: [:create, :destroy] do
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
