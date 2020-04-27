class Location < ApplicationRecord
	belongs_to :emergency
	belongs_to :neighborhood
end
