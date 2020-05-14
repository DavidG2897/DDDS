class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
	#FIXME check whether current user id matches the user to which the locations are associated to
      if !current_user.nil?
      	em_id = params[:em_id]
		@stype = params[:stype]
      	@locations = Emergency.find(em_id).locations
      else
	    redirect_to root_path, :alert => 'Please log in'
      end
  end

  def new
	@location = Location.new
  end

  def create

  	#FIXME add conditional checking for db update

  	if Emergency.where(id: params[:em_id]).exists?

		latvar  = params[:lat].to_f/1000000.0
		longvar = params[:long].to_f/1000000.0
		
		n_id = GoogleClient.new.get_neighborhood_id(latvar.to_s,longvar.to_s)

		@location = Location.new
		@location.lat  = latvar
		@location.long = longvar
		@location.emergency_id = params[:em_id]
		@location.neighborhood_id = n_id
		@location.save!
		#TODO get this at uC
		render plain: 'success'
	else
		#TODO get this at uC
		render plain: 'error'
	end
  end

end
