class AccessPoint < ApplicationRecord
  include RailsSettings::Extend
  has_one :coordinate, as: :locatable, :dependent => :destroy
  belongs_to :zone
  has_many :issues
  has_many :datums
  has_many :channels, class_name: "ApChannel"
  accepts_nested_attributes_for :channels, allow_destroy: true
  accepts_nested_attributes_for :coordinate

  validates_presence_of :zone, message: "can't be blank"
  validates_presence_of :ip_address, message: "can't be blank"
  validates_presence_of :mac_address, message: "can't be blank"
  validates_presence_of :coordinate
  validates_presence_of :channels

  delegate :latitude, :longitude, to: :coordinate
  delegate :name, to: :zone, prefix: true

  default_scope { where.not(zone_id: nil) }

  after_create :default_values

  def users_count
    datums.all.uniq { |p| p.mobile }.count
  end

  def users_average
    datums.where('created_at > ?',30.days.ago).uniq { |p| p.mobile.user }.count
  end

  def issues_this_month
    issues.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).count
  end

  private

  def default_values
    settings.min_jitter = Setting.min_jitter
    settings.max_jitter = Setting.max_jitter
    settings.min_ping = Setting.min_ping
    settings.max_ping = Setting.max_ping
    settings.min_latency = Setting.min_latency
    settings.max_latency = Setting.max_latency
    settings.min_link_speed = Setting.min_link_speed
    settings.max_link_speed = Setting.max_link_speed
    settings.min_sign_level = Setting.min_sign_level
    settings.max_sign_level = Setting.max_sign_level
    settings.distance = Setting.distance
  end
end
