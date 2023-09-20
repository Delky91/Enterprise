Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :jobs do
    resources :job_applications, only: %i[new create]
  end

  root 'jobs#index'
end
