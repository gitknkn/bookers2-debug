Rails.application.routes.draw do


  # get 'search/search'
  root 'home#top'
  get 'home/about'
  # get 'relationships/create'
  # get 'relationships/destroy'

  devise_for :users 

  get 'search' => 'search#search', as: 'search'
  
  resources :users, only: [:show,:index,:edit,:update,] do
    resource :relationships, only: [:create, :destroy]
    get 'followers' => 'users#followers', as: 'followers'
    get 'follows' => 'users#follows', as: 'follows'
  end

  resources :books do
    resource :post_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :post_comments, only: [:destroy]

end