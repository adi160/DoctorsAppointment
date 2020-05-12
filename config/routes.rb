Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users
  
  get 'home/index'
  get 'clinics/get_clinic_variable'

  resources :doctors do
    resources :clinics
    resources :schedules
  end

  get '/profile/:id', to: 'doctors#profile', as: 'profile'

  resources :patients
end
