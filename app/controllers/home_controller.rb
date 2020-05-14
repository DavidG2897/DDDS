class HomeController < ApplicationController
  def index
	if current_user
	  @user_emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies
	end
  end
end
