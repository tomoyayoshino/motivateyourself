Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/about', to:'staticpages#about'
  resources :posts do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end

