require 'net/http'

class GoogleClient

	def get_neighborhood_id(lat,long)

		api_key = get_api_key		
		req = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + long + '&key=' + api_key
		uri = URI(req)
		
		retval = Net::HTTP.get(uri)
		results = retval[/formatted_address.*$/i].split(': ')
		ret = results[1].split(', ')
		neigh = ret[1]
		
		#FIXME next queries does not support special characters such as 'ñ', need to fix that
		if !Neighborhood.where(name: neigh).exists?
			@neighborhood = Neighborhood.new
			@neighborhood.name = neigh
			@neighborhood.save!
			res = @neighborhood.id
		else
			res = Neighborhood.find_by(name: neigh).id
		end
		
		return res
		
	end
	
	private
		def get_api_key
			Rails.application.credentials.google[:api_key]
		end

end
