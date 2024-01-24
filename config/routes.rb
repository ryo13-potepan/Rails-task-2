Rails.application.routes.draw do
  get 'tops/index'
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/index'
  get 'rooms/index'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/search'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  patch 'users/update'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tops#index'
  get 'search', to: 'tops#search', as: 'search'
end
