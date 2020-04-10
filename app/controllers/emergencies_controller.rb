class EmergenciesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def show 
		#TODO make a route for users to see their emergencies
	end

	def new
		@emergency = Emergency.new
	end

	def create

		#TODO: validate range of latitude and longitude

		@emergency = Emergency.new
		@emergency.lat  = params[:lat]
		@emergency.long = params[:long]
		if Device.where(dispid: params[:devid]).exists?
			dev = Device.find_by(dispid: params[:devid])
			@emergency.device_id = dev.id
			@emergency.save
		else
			#TODO respond back with error
			puts 'QUELAVERGA'
		end
	end

	def destroy
		#TODO make only admin accounts be able to delete or modify emergencies
	end

end
