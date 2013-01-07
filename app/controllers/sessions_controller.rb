class SessionsController < ApplicationController

  def new
  	render "sign_in"
  end
  
  def create
    @current_user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @current_user.id
    if mobile_device?
      unless session[:attending_event].nil?
        print "\nSending to fb from sessions controller\n"
        @current_user.attend_to(session[:attending_event])
        session[:attending_event] = nil
        redirect_to mobile_app_events_path
      else
        redirect_to root_path
      end
    elsif @current_user.is_admin
    	redirect_to admin_root_path
    else
    	render "not_allowed"
    end
  end

  def destroy
    if @current_user.is_admin
      session[:user_id] = nil
      @current_user = nil 
      redirect_to admin_root_url
    else
      session[:user_id] = nil
      @current_user = nil 
      redirect_to mobile_app_root_url
    end
  end
end

