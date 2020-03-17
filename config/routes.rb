Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :values
    end
  end
  namespace :api do 
    namespace :v1 do
      resources :planned_expenses
    end
  end
  
  namespace :api do 
    namespace :v1 do
      resources :currencies
    end
  end

  namespace :api do
    namespace :v1 do
      resources :trips
    end
  end
  
  get 'api/v1/destinations/top', to: 'api/v1/destinations#topDestinations'
  get '/api/v1/destinations/top/all', to: 'api/v1/destinations#orderedDestinations'
  namespace :api do
    namespace :v1 do
      resources :destinations
    end
  end

  get 'api/v1/users/:id/trips', to: 'api/v1/users#userTrips'
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# resources :userhome, :only => [:index] - method to limit routes that won't be needed.