class Emergency < ApplicationRecord
  belongs_to :admin_device
  has_many :locations, dependent: :destroy
end
