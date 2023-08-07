Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index]
      resources :recipes, only: [:index]
      resources :learning, only: [:index]
      resources :users, only: [:create]
      resources :air_quality, only: [:index]
      resources :favorites, only: [:create], to: "users/favorites#create"
    end
  end
end
