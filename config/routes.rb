TeclaCultura::Application.routes.draw do      
	
	namespace :mobile_app do   
		resources :info_pages, :only=>[:show]
		resources :places, :only=>[:show,:index]
		resources :place_types, :only=>[:show,:index]
		resources :galleries, :only=>[:show,:index]
		resources :events, :only=>[:show,:index]
		get "home" => "home#index", :as=>:mobile_root
	end
                                  

	namespace :admin do                   
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
		root :to => "admin/events#index"
	end
  

end
