class MobileApp::GalleriesController < MobileApp::MobileController
  def index
  	@galleries_groups = Gallery.all.each_slice(4).to_a
  	print "\n#{@galleries_groups.to_yaml}\n"
  end

  def show
  	@gallery = Gallery.find_by_id(params[:id])
  end
end
