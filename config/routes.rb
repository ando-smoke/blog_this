Rails.application.routes.draw do
  devise_for :users
  # root to: 'posts#index'
  root to: 'home#index'

  resources :posts do
    resources :comments, :except => [:show, :index]
  end
end
