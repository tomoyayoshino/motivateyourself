Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/about', to: 'staticpages#about'
  get '/help', to: 'staticpages#help'
  get '/timer', to: 'staticpages#timer'

  resources :tasks

  resources :posts do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    member do
      get 'follows'
      get 'followers'
    end
    collection do
      get 'search'
    end
  end
  post 'users/guest_sign_in', to: 'users#new_guest'

  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]

  resources :notifications, only: :index

  resources :events do
    resource :participations, only: [:create, :destroy]
  end
end
