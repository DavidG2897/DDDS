class HomeController < ApplicationController
  def index
	if current_user
	  if !current_user.device.nil?
	    @user_emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies.order(created_at: :desc)
		@user_em_cnt = @user_emergencies.length()
	  end
	  @all_locs = ActiveRecord::Base.connection.execute("SELECT lat, long as lng, COUNT(lat) as cnt FROM Locations GROUP BY lat, long")
	  @all_em_cnt = Emergency.all.length()
	end
  end
end
