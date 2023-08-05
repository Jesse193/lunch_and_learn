Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index]
      resources :recipes, only: [:index]
    end
  end
end
