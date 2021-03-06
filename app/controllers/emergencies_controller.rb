class EmergenciesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

    def index 
	  @all = params[:all]
      if !current_user.nil?
		if @all == 'true'
			@emergencies = Emergency.all
      	elsif current_user.device.nil? && @all == 'false'
			redirect_to root_path, :alert => 'Please register your device to check your emergencies'
		elsif !current_user.device.nil? && @all == 'false'
			@emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies
		end
      else
      	redirect_to root_path, :alert => 'Please log in to check emergencies'
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
			
			latvar  = params[:lat].to_f/1000000.0
			longvar = params[:long].to_f/1000000.0
			
			n_id = GoogleClient.new.get_neighborhood_id(latvar.to_s, longvar.to_s)
			
			@location = Location.new
			@location.lat  = latvar
			@location.long = longvar
 			@location.emergency_id = e_id
			@location.neighborhood_id = n_id
			@location.save!
			
			#TODO get this at uC
			render plain: e_id
		else
			#TODO get this at uC
			render plain: 'error'
		end
	end
end
