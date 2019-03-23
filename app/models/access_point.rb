class AccessPoint < ApplicationRecord
  include RailsSettings::Extend
  has_one :coordinate, as: :locatable, :dependent => :destroy
  belongs_to :zone
  has_many :issues
  has_many :datums
  accepts_nested_attributes_for :coordinate

  validates_presence_of :zone, message: "can't be blank"
  validates_presence_of :ip_address, message: "can't be blank"
  validates_presence_of :coordinate

  delegate :latitude, :longitude, to: :coordinate

  def users_count
    datums.all.uniq { |p| p.user }.count
  end

  def users_average
    users_count / Users.count
  end

  def issues_this_month
    issues.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  end
end
