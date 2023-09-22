Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :jobs do
    resources :job_applications, only: %i[new create]
  end

  root 'home#index'
end
