Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users
  resources :patients
  
  resources :doctors do
    resources :clinics
    resources :schedules
  end

  get '/profile/:id', to: 'doctors#profile', as: 'profile'
  get 'home/index'
  get 'patient_list', to: 'patients#patient_list'
  get 'clinics/get_clinic_variable'
  
  match '*path' => 'application#error_404', via: :all
end
