Rails.application.routes.draw do
  get "login", to: "sessions#new"
  resource :session, except: :new
  resources :passwords, param: :token

  get "dashboard", to: "guests#index"
  resources :guests

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
  # get "dashboard", to: "pages#dashboard"
end
