Rails.application.routes.draw do
  resources :items
  resources :lists

  root 'items#index'
end
