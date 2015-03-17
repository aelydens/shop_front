Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:new, :create, :show, :index]
end
