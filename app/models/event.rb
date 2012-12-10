class Event < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :cover, :date_at, :description, :flayer, :name, :place_id, :state,:start_at, :address,:map_zoom, :map_latlng
  has_many :galleries
  belongs_to :place
  mount_uploader :flayer, EventCoverUploader
  def location
  	place.nil? ? address : place.location
  end
  def date_for_fb
  	date_at+6.hours
  end

  def changes_to_fb
    changes_fb = Hash.new
    self.changes.each do |k,v|
      case k
        when "flayer"
          changes_fb[:picture] = v.last
        when "date_at"
          changes_fb[:start_time] = v.last
        when "place_id", "address"
          changes_fb[:location] = location
        when "name", "description"
          changes_fb[k.to_sym] = v.last
      end
    end
    return changes_fb
  end

  def lat
    if place.nil?
      map_latlng.delete("(").delete(")").strip.split(",")[0] unless map_latlng.nil?
    else
      place.lat
    end
  end

  def lng
    if place.nil?
      map_latlng.delete("(").delete(")").strip.split(",")[1] unless map_latlng.nil?
    else
      place.lng
    end
  end

  def zoom
    self.map_zoom.blank? ? 15 : self.map_zoom
  end

  def self.on_day(date)
    Event.where(:date_at=>(date.beginning_of_day..date.end_of_day )).order(:start_at)
  end

  def self.grouped_events_by_day(date)
    hash = Hash.new
    Event.where(:date_at=>(date.beginning_of_month..date.end_of_month )).order(:start_at).each do |event|
      if !hash.has_key?(event.start_at.day.to_i.to_s.to_sym)
        hash[event.start_at.day.to_i.to_s.to_sym]={ event.start_at.hour.to_i.to_s.to_sym=>event}
      else
        hash[event.start_at.day.to_i.to_s.to_sym][event.start_at.hour.to_i.to_s.to_sym] = event
      end
    end
    return hash
  end

  def self.up_coming_events
    hash = Hash.new
    date = Date.today
    Event.where(:date_at=>(date..date.end_of_month )).order(:start_at).limit(3).each do |event|
      if !hash.has_key?(event.start_at.day.to_i.to_s.to_sym)
        hash[event.start_at.day.to_i.to_s.to_sym]=[event]
      else
        hash[event.start_at.day.to_i.to_s.to_sym] << event
      end
    end
    return hash
  end

end
