Rails.application.routes.draw do
  resources :patients
  resources :doctors
  resources :medical_sessions
  resources :treatments
  resources :rooms
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
