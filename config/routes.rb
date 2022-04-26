Rails.application.routes.draw do
  devise_for :users
  
  resources :cars do
    collection do
      get "manager_cars/:user_id", action: :manager_cars
    end
  end

  root "cars#index"
end
