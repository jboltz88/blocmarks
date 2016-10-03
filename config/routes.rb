Rails.application.routes.draw do

  get 'users/show'

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users
  
  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'

  authenticated do
    root to: 'topics#index', as: :authenticated_root
  end

  get 'welcome/show'

  root to: 'welcome#show'
end
