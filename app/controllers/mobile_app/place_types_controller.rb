class MobileApp::PlaceTypesController < MobileApp::MobileController
  def index
  	@place_types = PlaceType.all
  end
end
