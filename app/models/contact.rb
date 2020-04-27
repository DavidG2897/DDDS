class Contact < ApplicationRecord
 	validates :fname, presence: true
 	validates :lname, presence: true
 	validates :cellphone, presence: true, numericality: true, length: {minimum: 10, maximum: 10}
	validate :validate_cellphone
	before_update :validate_cellphone
	belongs_to :user

	def validate_cellphone
		#FIXME, make this work so validation is done here and not at controller
		#if Contact.where(user_id: self.user_id, cellphone: self.cellphone).exists?
		#	errors.add(:contact, 'is already registered')
		#else
		if AdminDevice.where(serial: self.cellphone).exists?
				errors.add(:contact, 'cellphone registered as device, contact administration')
			else
        #TODO, validate cellphone format using regex, maybe??
				return
			end
		#end
	end
end
