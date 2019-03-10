class Zone < ApplicationRecord
  has_many :coordinates, as: :locatable
  accepts_nested_attributes_for :coordinates
  validates_presence_of :name, message: "can't be blank"
end
