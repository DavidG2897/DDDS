class SyncController < ApplicationController

	def update
		if !current_user.nil?
			#Send SMS to current_user.dispid here
			#if it worked then save synched value as true
			#for current_user
			current_user.synched = true
			current_user.save
			redirect_to edit_user_registration_path
		end
	end
end
