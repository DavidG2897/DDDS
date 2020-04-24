class SyncController < ApplicationController

	def update
		if !current_user.nil?
			dest = '+52' + current_user.device.dispid
			contacts = current_user.contacts
			
			msg = ''
			contacts.each do |c|
				msg = msg + c.cellphone + ','
			end
			msg = msg + current_user.email;
			TwilioClient.new.send_sms(dest,msg)
			
			current_user.synched = true
			current_user.save
			redirect_to edit_user_registration_path
		end
	end
end
