Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :jobs do
    resources :job_applications, only: %i[new create]
  end

  # Ruta donde cada User podra ver sus postulaciones
  get 'job_applications', to: 'job_applications#index', as: 'job_applications_index'

  root 'home#index'
end
