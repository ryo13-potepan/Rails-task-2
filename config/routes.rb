Rails.application.routes.draw do
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
  get 'users/update'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
