class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
      if !current_user.nil?
      	em_id = params[:em_id]
      	@locations = Emergency.find(em_id).locations
      else 
      	redirect_to root_path
      end
  end

  def new
	@location = Location.new
  end

  def create

  	#FIXME add conditional checking for db update

  	if Emergency.where(id: params[:em_id]).exists?

		@location = Location.new
		@location.lat  = params[:lat].to_i
		@location.long = params[:long].to_i
		@location.emergency_id = params[:em_id]
		@location.save!
		#TODO get this at uC
		render plain: 'success'
	else
		#TODO get this at uC
		render plain: 'error'
	end
  end

end
