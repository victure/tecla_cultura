class Admin::EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.date_at = DateTime.parse("#{params[:event][:date_at]} #{params[:event][:start_at]} -0600")
    @event.start_at = DateTime.parse("#{params[:event][:date_at]} #{params[:event][:start_at]} -0600")
    respond_to do |format|
      if @event.save
        @current_user.create_fb_event(@event) if @current_user.is_admin
        format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    params[:event][:date_at] = DateTime.parse("#{params[:event][:date_at]} #{params[:event][:start_at]} -0600")
    params[:event][:start_at] = DateTime.parse("#{params[:event][:date_at]} #{params[:event][:start_at]} -0600")
    @event.assign_attributes(params[:event])
    print "\ncambios en el objeto=>#{@event.changes}\n"
    changes = @event.changes_to_fb
    print "\nchanges_to_fb antes de guardar=>#{changes}\n"
    respond_to do |format|
      if @event.save
        change_to_fb = @current_user.update_fb_event(@event,changes)
        print "\nSe cambio el de facebook=>#{change_to_fb}\n"
        format.html { redirect_to admin_events_path, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.json { head :no_content }
    end
  end
end
