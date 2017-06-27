Rails.application.routes.draw do
  root to: "courses#index"

  ActiveAdmin.routes(self)

  devise_for :users

  resources :users do
    collection do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :courses do
    resources :lessons, shallow: true
    resources :sessions, only: [:show, :create, :update]
    resources :enrollments, only: [:index, :new, :create, :destroy]
  end

  resources :organizations
end
