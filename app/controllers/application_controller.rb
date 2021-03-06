class ApplicationController < ActionController::Base
  	protect_from_forgery
  	layout :load_layout
  	before_filter :authenticate!
  	before_filter :load_user_to_models
		after_filter :set_access_control_headers
  def current_user
  		@current_user =  User.find_by_id(session[:user_id]) 
	end
	helper_method :current_user

	def current_user_signed_in?
		@current_user = User.find_by_id(session[:user_id])
		!@current_user.nil?
	end
	helper_method :current_user_signed_in?

	def authenticate!
		print "\ncontroller_name=>#{params[:controller]}\naction_name=>#{params[:action]}\n"
		if !is_a?(MobileApp::MobileController)
			if !current_user_signed_in? and !is_a?(SessionsController)
				@dialog = false
				redirect_to sign_in_path
			end
		end
	end

	def load_settings
		if !is_a?(MobileApp::MobileController)
			
		end
	end

	def load_layout
		@namespace = request.path.split('/')[1]
	end

	def load_user_to_models
		Event.current_user = current_user
		Gallery.current_user = current_user
		InfoPage.current_user = current_user
		Photo.current_user = current_user
		Place.current_user = current_user
		PlaceType.current_user = current_user
	end

	def mobile_device?
		if session[:mobile_param] or session[:mobile_param]=="true"
			session[:mobile_param] == "true"
		else
			mobile_devise_request?
		end
	end
	helper_method :mobile_device?
  
	def mobile_devise_request?
		request.user_agent =~ /Mobile|webOS/
	end
	helper_method :mobile_devise_request?

	def prepare_for_mobile
		session[:mobile_param] = params[:mobile] if params[:mobile]
		request.format = :mobile if mobile_device?
	end
	def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = '*' 
		headers['Access-Control-Request-Method'] = '*' 
	end
end
