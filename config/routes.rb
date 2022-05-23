Rails.application.routes.draw do
  get 'recipes/index'
  get 'ingredients/index'
  get 'articles/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get '/home', to: 'home#index'

  resources :ingredients, only: :index do
    get :edit_my_ingredients, on: :collection
  end

  resources :recipes, only: :index
  resources :users, only: %i[update edit]
end
