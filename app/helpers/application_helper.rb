module ApplicationHelper	
	def get_google_api_req
		"https://maps.googleapis.com/maps/api/js?key=" + get_google_api_key
	end
	
	def get_google_api_key
		Rails.application.credentials.google[:api_key]
	end
end
