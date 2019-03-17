class AccessPoint < ApplicationRecord
  include RailsSettings::Extend
  has_one :coordinate, as: :locatable
  belongs_to :zone
  has_many :issues
  has_many :datums
  accepts_nested_attributes_for :coordinate

  validates_presence_of :zone, message: "can't be blank"
  validates_presence_of :ip_address, message: "can't be blank"


  def users
    datums.where('created_at > ?', 5.minutes.ago).uniq { |p| p.user }.count
  end
end
