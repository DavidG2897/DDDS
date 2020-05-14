class HomeController < ApplicationController
  def index
	if current_user
	  if !current_user.device.nil?
	    @user_emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies
	  end
	  @all_locs = ActiveRecord::Base.connection.execute("SELECT lat, long as lng, COUNT(lat||long) as cnt FROM Locations GROUP BY lat, long")
	end
  end
end
