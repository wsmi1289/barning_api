Rails.application.routes.draw do
  root to: 'application#root'

  namespace :v1 do
    namespace :users do
      resources :sessions, only: [:create, :destroy]
      resources :registrations, only: [:create]
    end

    resources :recipes, only: [:index]
  end
end
