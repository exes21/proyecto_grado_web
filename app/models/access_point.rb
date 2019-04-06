class AccessPoint < ApplicationRecord
  include RailsSettings::Extend
  has_one :coordinate, as: :locatable, :dependent => :destroy
  belongs_to :zone
  has_many :issues
  has_many :datums
  accepts_nested_attributes_for :coordinate

  validates_presence_of :zone, message: "can't be blank"
  validates_presence_of :ip_address, message: "can't be blank"
  validates_presence_of :mac_address, message: "can't be blank"
  validates_presence_of :coordinate

  validates_uniqueness_of :ip_address
  validates_uniqueness_of :mac_address

  delegate :latitude, :longitude, to: :coordinate
  delegate :name, to: :zone, prefix: true

  default_scope { where.not(zone_id: nil) }

  after_create :default_values

  def users_count
    datums.all.uniq { |p| p.user }.count
  end

  def users_average
    users_count / Users.count
  end

  def issues_this_month
    issues.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  end

  private

  def default_values
    settings.min_jitter = Settings.min_jitter
    settings.max_jitter = Settings.max_jitter
    settings.min_ping = Settings.min_ping
    settings.max_ping = Settings.max_ping
    settings.min_latency = Settings.min_latency
    settings.max_latency = Settings.max_latency
    settings.min_link_speed = Settings.min_link_speed
    settings.max_link_speed = Settings.max_link_speed
    settings.min_sign_level = Settings.min_sign_level
    settings.max_sign_level = Settings.max_sign_level
  end
end
