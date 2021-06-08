Rails.application.routes.draw do
  root to: 'application#root'

  namespace :v1 do
    namespace :users do
      resources :sessions, only: [:create, :destroy]
      get 'sessions/current', to: 'sessions#current'
      resources :registrations, only: [:create]
    end

    resources :recipes, only: [:index, :destroy]
  end
end
