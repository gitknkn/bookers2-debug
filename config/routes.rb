Rails.application.routes.draw do

  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update,]
  resources :books do
    resource :post_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :post_comments, only: [:destroy]
end
