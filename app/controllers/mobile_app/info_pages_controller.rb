class MobileApp::InfoPagesController < MobileApp::MobileController
  def index
  	@pages = InfoPage.all
  end

  def show
  	@page = InfoPage.find(params[:id])
  end
end
