Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:new, :create, :show, :index]

  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-out', to: 'authentication#destroy'

end
