class AdminDevice < ApplicationRecord
	validates :serial, uniqueness: true, presence: true, length: {minimum:10, maximum: 10}
end
