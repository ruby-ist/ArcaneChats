Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users , only: [:index, :new, :create, :show] do
    resources :messages
  end
  get "signup", to: "users#new"
  get "login", to: "session#new"
  post "login", to: "session#create"
  get "logout", to: "session#destroy"
end
