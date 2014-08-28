Rails.application.routes.draw do
  root to: "cats#index"
  
  resources :cats, only: [:index, :show, :new, :edit, :create, :update]
  
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end
  
  resources :users, only: [:new, :create]
  
  resource :session, only: [:new, :create, :destroy]
end
