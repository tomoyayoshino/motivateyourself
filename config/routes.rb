Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/about', to:'staticpages#about'
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
  end

  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
end
