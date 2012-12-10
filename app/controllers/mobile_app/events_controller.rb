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
end