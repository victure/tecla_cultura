class MobileApp::EventsController < MobileApp::MobileController

  def index
    @selected = "hour-range-selected"
    @calendar = !params[:calendar].nil?
    if params[:month]
      @date_for_calendar = Date.parse(params[:month])
      @events = Event.grouped_events_by_day(@date_for_calendar)
      @up_comming = Event.up_coming_events
          
    elsif params[:date_at]
      @date_at = Date.parse(params[:date_at])
      @events = Event.on_day(@date_at)
    else
      @date_for_calendar = Date.today
      @events = Event.grouped_events_by_day(@date_for_calendar)
      @up_comming = Event.up_coming_events
    end 
  	
  	respond_to do |format|
      if @date_at
        format.html{ render "date_index"}
        format.mobile{ render "date_index"} 
      elsif @calendar
  		  format.html{ render :partial=>"calendar",:layout=>false}
  		  format.mobile{ render :partial=>"calendar",:layout=>false}
      else
        format.html
        format.mobile
  		end
      #format.json { json: { events: @events, date_for_calendar: @date_for_calendar}}
  	end
  end

  def show
  	@event = Event.find_by_id(params[:id])
  	respond_to do |format|
  		format.html
  		format.mobile
  		#format.json { json: {event: @event} }
  	end
  end

  def attend
    if current_user_signed_in?
      print "\nSending to fb from events controller\n"
      @attended = @current_user.attend_to(params[:event_id])
      @logged = true
      session[:login_for_mobile] = false
      session[:attending_event] = nil
    else
      print "\nFail sending to fb from events controller\n"
      @attended = false
      @logged = false
      session[:login_for_mobile] = true
      session[:attending_event] = params[:event_id]
    end
    respond_to do |format|
      format.html
      format.mobile
      format.json { render :json => {attended: @attended, logged: @logged}.to_json }
    end
  end
end