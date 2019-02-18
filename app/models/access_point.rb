class AccessPoint < ApplicationRecord
  has_one :cordinate
  belongs_to :zone

  validates_presence_of :zone, message: "can't be blank"
  validates_presence_of :ip_address, message: "can't be blank"
  validates_presence_of :mac_address, message: "can't be blank"
  
end
