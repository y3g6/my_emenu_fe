Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static#home"
  namespace :owner do
    resources :restaurants
  end

  namespace :api do
    namespace :v1 do
      resources :restaurants
    end
  end

  # root "articles#index"
  resources :categories
  resources :restaurants, only: [:index, :show]
  resources :users
end
