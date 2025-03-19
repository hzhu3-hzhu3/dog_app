Rails.application.routes.draw do
  get "dog_images/show"
  get "dog_diseases/show"
  get "facts/show"
  get "breeds/index"
  get "breeds/show"
  get "pages/about", to: "pages#about", as: "about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'breeds#index'
  resources :breeds, only: [:index, :show]
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  resources :dog_images, only: [:index, :show]
  resources :dog_diseases, only: [:show, :index]
  resources :facts, only: [:show, :index]
end
