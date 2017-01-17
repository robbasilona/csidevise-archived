Rails.application.routes.draw do
  resources :evac_centers
  resources :stocks
  resources :pins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :supplies
end
