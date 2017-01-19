Rails.application.routes.draw do
  resources :evac_centers
  resources :stocks
  resources :pins
  resources :supplies
  devise_for :users

  get 'supplies/:id/pins' => 'supplies#showPins'
  get 'pins/:id/supplies' => 'pins#showSupplies'
  get 'evac_centers/rank/*lat/*lon' => 'evac_centers#rank'
  get 'evac_centers/near/:place' => 'evac_centers#near'
  post 'chikka/receive' => 'chikka#receiveChikka'
end
