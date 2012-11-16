TeclaCultura::Application.routes.draw do
  root :to => 'events#index'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  match "sign_in", to: 'sessions#new', as: "sign_in"

  resources :photos, :only => [:new,:create,:show,:destroy]
  post "photos/multiple/:id" =>  "photos#multiple_create", as: "multiple_photos"
  
  resources :galleries

  resources :events

  resources :info_pages

  resources :places

  resources :place_types

end
