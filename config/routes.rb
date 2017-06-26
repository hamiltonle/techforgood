Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'
  
  get 'lessons/index'

  get 'lessons/show'

  get 'lessons/new'

  get 'lessons/create'

  get 'lessons/edit'

  get 'lessons/update'

  get 'lessons/destroy'

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
