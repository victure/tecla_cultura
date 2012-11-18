class MobileApp::EventsController < ApplicationController
	before_filter :load_date
  def index
  	@events = Event.where(:date_at => (@date.beginning_of_month-1)..(@date.end_of_month+1))
  	respond_to do |format|
  		format.html
  		format.mobile
  		format.json { json: {:events=>@events,:date_for_calendar=>@date_for_calendar}}
  	end
  end

  def show
  	@event = Event.find_by_id(params[:id])
  	respond_to do |format|
  		format.html
  		format.mobile
  		format.json { json: @event }
  	end
  end

  def show_events_for_date
  	@events = Event.where(:date_at => @date_at)
  	respond_to do |format|
  		format.html
  		format.mobile
  		format.json { json: {:events=>@events,:date_for_calendar=>@date_for_calendar,:date_at => @date_at}}
  	end 
  end

  def load_date
  	@date_for_calendar = params[:month] ? Date.parse(params[:month]) : Date.today
  	@date_at ||= Date.parse(params[:date_at])
  end
  
end
