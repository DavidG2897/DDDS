class EmergenciesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

    def index
      if !current_user.nil?
        @emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies
      else
      	redirect_to root_path
      end
    end

	def new
		@emergency = Emergency.new
	end

	def create

		#TODO: validate range of latitude and longitude
		#TODO: validate format of lat and long

		@emergency = Emergency.new
		@emergency.lat  = params[:lat]
		@emergency.long = params[:long]
		if Device.where(dispid: params[:devid]).exists?
			dev = AdminDevice.find_by(serial: params[:devid])
			@emergency.admin_device_id = dev.id
			@emergency.save
			#TODO get this at uC
			render plain: 'success'
		else
			#TODO get this at uC
			render plain: 'error'
		end
	end
end
