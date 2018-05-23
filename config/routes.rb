Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :categories
  resources :ideas

  resources :users, only: [:new, :show, :create]

  namespace :admin do
    resources :categories, only: [:index]
  end

end
