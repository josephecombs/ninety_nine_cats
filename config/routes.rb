Rails.application.routes.draw do
  root to: "cats#index"
  
  resources :cats, only: [:index, :show, :new, :edit]
  
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end
end
