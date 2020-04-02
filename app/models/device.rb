class Device < ApplicationRecord
	validates :dispid, uniqueness: true, presence: true, length: {minimum:10, maximum: 10}
	validate :validate_dev_id
	before_update :validate_dev_id
	belongs_to :user

	def validate_dev_id
		if AdminDevice.where(serial: self.dispid).exists?
			return
		else
			errors.add(:device, 'invalid ID')
		end
	end
end
