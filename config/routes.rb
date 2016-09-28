Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end 

  devise_for :users

  authenticated do
    root to: 'topics#index', as: :authenticated_root
  end

  get 'welcome/show'

  root to: 'welcome#show'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
