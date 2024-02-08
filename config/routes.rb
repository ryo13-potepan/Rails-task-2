Rails.application.routes.draw do
  get 'tops/index'
  root to: "tops#index"
  
  resources :reservations do
    post 'reservations/confirm', on: :collection
  end
  
  resources :rooms do
    get 'search', on: :collection
  end

  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/index'
  get 'reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservation'

  get 'rooms/index'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/search'

  get 'users/new'
  get 'users/create'
  get 'users/edit'
  patch 'users/update'
  get 'users/show'
  
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  get 'search', to: 'tops#search', as: 'search'
  
end
