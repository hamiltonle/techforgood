Rails.application.routes.draw do
  root to: "courses#index"

  mount Attachinary::Engine => "/attachinary"

  ActiveAdmin.routes(self)

  devise_for :users

  resources :users do
    collection do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :courses do
    resources :enrollments, only: [:index, :new, :create, :destroy]

    resources :lessons do
      resources :sessions, only: [:show, :new, :create, :edit, :update]
      resources :quizzes
    end
  end


  resources :questions
  resources :organizations
end
