Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :climbing_routes, only: :index
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
