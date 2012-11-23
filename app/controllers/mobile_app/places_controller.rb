class MobileApp::PlacesController < MobileApp::MobileController
	before_filter :load_type
  def index
  	print "\n!@type.nil? on index=>#{!@type.nil?}\n"
  	@places = !@type.nil? ? Place.actives.where(:place_type_id=>@type.id) : Place.all
  end

  def show      
		@place = Place.find_by_id(params[:id])
  end

  def load_type
  	@type = PlaceType.find_by_id(params[:place_type_id])
  	print "\n@type.nil?=>#{@type.nil?}\n"
  end
end
