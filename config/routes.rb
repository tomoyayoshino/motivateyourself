Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/about', to:'staticpages#about'
  resources :posts
  resources :users, only: :show
end

