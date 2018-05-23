Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :categories
  resources :images

  resources :users, only: [:new, :show, :create] do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
    resources :images, only: [:new, :create, :edit, :update, :destroy]
  end
end
