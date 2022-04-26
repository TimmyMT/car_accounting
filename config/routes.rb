Rails.application.routes.draw do
  get 'sessions/logout'
  devise_for :users

  resources :users
  resources :cars do
    collection do
      get "manager_cars/:user_id", action: :manager_cars
    end
  end
  resources :main, only: :index

  root "main#index"
end
