Rails.application.routes.draw do


  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  resources :sessions, only: [:new, :create, :destroy]


  resources :users
  namespace :api do

    resources :todo_lists do
      resources :todo_items
    end

  end
end
