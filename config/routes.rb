Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users

  post :incoming, to: 'incoming#create'

  authenticated do
    root to: 'topics#index', as: :authenticated_root
  end

  get 'welcome/show'

  root to: 'welcome#show'
end
