class AccessPoint < ApplicationRecord
  has_one :coordinate, as: :locatable
  belongs_to :zone
  accepts_nested_attributes_for :coordinate

  validates_presence_of :zone, message: "can't be blank"
  validates_presence_of :ip_address, message: "can't be blank"
  validates_presence_of :mac_address, message: "can't be blank"

end
