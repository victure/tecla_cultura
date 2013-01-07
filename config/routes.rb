TeclaCultura::Application.routes.draw do      
	
  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"

	namespace :mobile_app do   
		resources :info_pages, :only=>[:show,:index]
		resources :places, :only=>[:show,:index]
		get "map" => "places#map", :as=>"places_map_location"
		resources :place_types, :only=>[:show,:index]
		resources :galleries, :only=>[:show,:index]
		resources :events, :only=>[:show,:index]
		post "event/:event_id/attend/" => "events#attend", :as => "attend_event"
		root :to => "home#index"
	end
     
	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	scope "mobile_app" do
		get "sign_in" => "sessions#new",  as: "mobile_sign_in"
	  	delete 'sign_out', to: 'sessions#destroy', as: 'mobile_sign_out'
	end
	scope "admin" do
		get "sign_in" => "sessions#new"
	  	delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
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
