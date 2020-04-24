Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'home/index'
  get 'clinics/get_clinic_variable'

  resources :doctors do
    resources :clinics
  end
  
  resources :schedules
  resources :patients
end
