Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms, only: %i[show destroy index update]
  resources :clients, only: %i[show update index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
