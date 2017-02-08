Rails.application.routes.draw do  
  # Added devise routes and overrided registration controller
  devise_for :users, :controllers => { registrations: 'registrations' }
  # hotel resources only with index route
  resources :hotel, only: :index do
    get :rooms, on: :collection
  end
  
  # Listing our all the bookings of the user
  resources :bookings, only: :index

  # Using resource hotel_categories for using the hotel_category_id for nested resources
  resources :hotel_categories, only: [] do
    # Using booking resources
    resources :bookings, only: [:new, :create] do 
      collection do
        get :search_rooms
        # route for checkig available_rooms
        get :available_rooms
      end
    end
  end

  # api routes
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_for :users
      resources :hotel_rooms, only: :index
      resources :booking_informations, only: :index
    end
  end

  # root path 
  root "hotel#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
