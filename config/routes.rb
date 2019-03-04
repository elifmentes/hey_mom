Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index] do
    resources :tasks, only: [:index] do
      resources :steps, only: [:index, :show] do
        resources :instructions, only: [:index, :show]
      end
    end
  end
end
