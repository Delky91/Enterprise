Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :jobs do
    resources :job_applications, only: %i[new create]
  end

  # Cambio la ruta
  get '/user' => 'jobs#index', :as => :user_root

  root 'home#index'
end
