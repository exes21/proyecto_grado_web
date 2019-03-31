class Zone < ApplicationRecord
  has_many :coordinates, as: :locatable
  has_many :access_points
  accepts_nested_attributes_for :coordinates
  validates_presence_of :name, message: "can't be blank"

  before_destroy do
    access_points.each do |ap|
      ap.zone = nil
      ap.save!(validate: false)
    end
  end

  def display_aps
    result = []
    {}.tap do |ap_data|
      access_points.each do |ap|
        ap_data[:ssid] = ap.ssid
        ap_data[:mac] = ap.mac_address
        ap_data[:latitude] = ap.latitude
        ap_data[:longitude] = ap.longitude

        result << ap_data
      end
    end
    result.to_json
  end
end
