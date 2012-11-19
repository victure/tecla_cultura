TeclaCultura::Application.routes.draw do      
	
  get "home/index"

	namespace :mobile_app do   
		resources :info_pages, :only=>[:show]
		resources :places, :only=>[:show,:index]
		resources :place_types, :only=>[:show,:index]
		resources :galleries, :only=>[:show,:index]
		resources :events, :only=>[:show,:index]
		root :to => "home#index"
	end
     
	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	scope "admin" do
		get "sign_in" => "sessions#new"
	  	match 'sign_out', to: 'sessions#destroy', as: 'sign_out'
	end
	                             
	root :to =>"mobile_app/home#index"
	namespace :admin do   
	  root :to =>"events#index"
	  resources :photos, :only => [:new,:create,:show,:destroy]
	  post "photos/multiple/:id" =>  "photos#multiple_create", as: "multiple_photos"   
	  resources :galleries 
	  resources :events    
	  resources :info_pages
	  resources :places    
	  resources :place_types
	end
  

end
