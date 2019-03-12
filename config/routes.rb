Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/tasks', to: 'categories#show'
  get '/map', to: 'pages#map', as: :map
  resources :transactions

  resources :categories, only: [:index]
  resources :tasks, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:show] do
    resources :tasks, only: [:show] do
      resources :steps, only: [:show]
    end
  end
end

