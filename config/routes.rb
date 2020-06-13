Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/about', to:'staticpages#about'
  # post   '/like/:post_id', to: 'likes#like',   as: 'like'
  # delete '/like/:post_id', to: 'likes#unlike', as: 'unlike'
  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: :show
end

