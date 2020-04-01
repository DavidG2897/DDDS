class Device < ApplicationRecord
	validates :dispid, uniqueness: true, presence: true, length: {minimum:10, maximum: 10}
	belongs_to :user
end
