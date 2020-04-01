class Contact < ApplicationRecord
 	#TODO validates_format_of :cellphone, :with => \A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z, :on => :create
 	validates :fname, presence: true
 	validates :lname, presence: true
  	belongs_to :user
end
