Rails.application.routes.draw do

get '/' => 'users#welcome'
devise_for :users

resources :pets, only: [:index, :show, :edit, :destroy, :new, :create, :update]
# resources :maps, only: [:index, :new, :create, :edit, :update, :destroy, :show]


end
