class DevicesController < ApplicationController

	def new
		@device = Device.new
	end

	def edit
		@device = Device.find(params[:id])
	end

	def create
		@device = Device.new(device_params)
		@user = current_user
		@device.admin_device_id = AdminDevice.where(serial: @device.dispid).first&.id
		@device.user_id = current_user.id
		@user.device = @device.id #related to has_one at model
		if @device.save #first validate new device coudl be saved
			if @user.save #then validate user coud be saved
				#done in nested ifs to avoid saving failure at one save causing other save to be done either way
				#TODO: send SMS to device using dispid
				redirect_to edit_user_registration_path
				else
					render 'new'
				end
		else
			render 'new'
		end
	end

	def update
		@device = Device.find(params[:id])
		@device.admin_device_id = AdminDevice.where(serial: device_params[:dispid]).first&.id
		if @device.update(device_params)
			redirect_to edit_user_registration_path
		else
			render 'edit'
		end
	end

	private
		def device_params
			params.require(:device).permit(:dispid)
		end

end
