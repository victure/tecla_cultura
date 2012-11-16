class Event < ActiveRecord::Base
  attr_accessible :cover, :date_at, :description, :flayer, :name, :place_id, :state,:start_at, :address
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
end
