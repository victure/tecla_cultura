class ApplicationController < ActionController::Base
  	protect_from_forgery
  	before_filter :authenticate!
  	
  	def current_user
  		@current_user = session[:user_id].nil? ? User.find(session[:user_id]) : nil
	end
	helper_method :current_user

	def current_user_signed_in?
		@current_user = !session[:user_id].nil? ? User.find_by_id(session[:user_id]) : nil
		print "aqui esta=>#{@current_user.nil?}"
		!@current_user.nil?
	end
	helper_method :current_user_signed_in?

	def authenticate!
		if !current_user_signed_in? and !is_a?(SessionsController)
			redirect_to sign_in_path
		end
	end
end
