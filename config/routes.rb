Rails.application.routes.draw do
  resources :animated_gifs
  resources :items
  resources :lists

  root 'items#index'
end
