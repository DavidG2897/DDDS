class HomeController < ApplicationController
  def index
	if current_user
	  if !current_user.device.nil?
	    @user_emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies.order(created_at: :desc)
		@user_em_cnt = @user_emergencies.length()
	  end
	  #@all_locs = ActiveRecord::Base.connection.execute("SELECT DISTINCT ON (emergency_id) * FROM (SELECT l.lat, l.long as lng, e.created_at as e_ca, l.created_at, l.emergency_id FROM Emergencies e, Locations l WHERE e.id = l.emergency_id ORDER BY e.created_at, l.created_at ASC) subq")
	  @all_locs = Location.all
	  @all_em_cnt = Emergency.all.length()
	end
  end
end
