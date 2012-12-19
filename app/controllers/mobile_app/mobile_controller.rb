class MobileApp::MobileController < ApplicationController
	layout :load_layout
	before_filter :set_mobile_format

	def set_mobile_format
		request.format = :mobile unless request.format == :json
	end

	def load_layout
		"mobile_app"
	end
end
