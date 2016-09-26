Rails.application.routes.draw do

  devise_for :users

  authenticated do
    root to: 'welcome#show', as: :authenticated_root
  end

  get 'welcome/show'

  root to: 'welcome#show'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
