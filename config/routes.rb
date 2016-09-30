Rails.application.routes.draw do

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end 
  end

  devise_for :users

  post :incoming, to: 'incoming#create'

  authenticated do
    root to: 'topics#index', as: :authenticated_root
  end

  get 'welcome/show'

  root to: 'welcome#show'
end
