Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :courses do
    resources :lessons, shallow: true

    resources :enrollments, only: [:index, :new, :create, :destroy]
  end

  resources :organizations
  resources :sessions, only: [:show, :create, :update]
  root to: "courses#index"
end
