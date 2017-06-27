Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :users do
    collection do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :courses do
    resources :lessons, shallow: true
  end

  resources :organizations

  resources :enrollments, only: [:index, :new, :create, :destroy]

  resources :sessions, only: [:show, :create, :update]

  root to: "courses#index"

end
