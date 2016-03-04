Rails.application.routes.draw do
  root 'trips#index'

  resources :locations do
    resources :addresses
  end

  resources :trips do
    resources :locations
  end
end
