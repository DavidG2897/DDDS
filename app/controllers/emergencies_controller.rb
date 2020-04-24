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

		#FIXME add conditional checking for db update

		if Device.where(dispid: params[:devid]).exists?
			dev = AdminDevice.find_by(serial: params[:devid])
			@emergency = Emergency.new
			@emergency.admin_device_id = dev.id
			@emergency.save!
			e_id = @emergency.id

			@location = Location.new
			@location.lat  = params[:lat].to_i
			@location.long = params[:long].to_i
 			@location.emergency_id = e_id
			@location.save!
			#TODO get this at uC
			render plain: e_id
		else
			#TODO get this at uC
			render plain: 'error'
		end
	end
end
