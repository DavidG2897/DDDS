class EmergenciesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

    def index
	  #FIXME: make alert show correctly
      if !current_user.nil?
		if current_user.device.nil?
		#FIXME: this does not re-render map when coming from sidebar, weird... check sidebar
			redirect_to root_path, :alert => 'Please register your device to check your emergencies'
		else
			@user_emergencies = AdminDevice.find_by(serial: current_user.device.dispid).emergencies.order(created_at: :desc)
			@user_em_cnt = @user_emergencies.length()
			
			em = params[:em]
			ad_id = AdminDevice.find_by(serial: current_user.device.dispid).id
			query = "SELECT DISTINCT ON (emergency_id) * FROM (SELECT e.admin_device_id, l.lat, l.long as lng, e.created_at as e_ca, l.created_at, l.emergency_id FROM Emergencies e, Locations l WHERE e.id = l.emergency_id ORDER BY e.created_at, l.created_at ASC) subq WHERE admin_device_id = " + ad_id.to_s + " AND emergency_id = " + em
			@first_loc_per_em = ActiveRecord::Base.connection.execute(query)
			@em_related_locs = Location.where(emergency_id: em.to_i)			
			@emergency = Emergency.find(em.to_i)
		end
      else
      	redirect_to root_path, :alert => 'Please log in'
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
