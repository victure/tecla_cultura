class SessionsController < ApplicationController

  def new
  	render "sign_in"
  end
  
  def create
    @current_user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @current_user.id
    if @current_user.is_admin
    	redirect_to root_url
    else
    	render "not_allowed"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil 
    redirect_to root_url
  end
end

