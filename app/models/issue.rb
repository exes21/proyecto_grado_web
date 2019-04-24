class Issue < ApplicationRecord
  #belongs_to :user
  belongs_to :access_point
  has_many :issues_reports

  accepts_nested_attributes_for :issues_reports

  acts_as_commentable

  enum priority: [:irrelevante, :bajo, :medio, :alto]
  enum status: [:activo, :inactivo, :cancelado, :resuelto]
  enum category: [:ping, :latency, :jitter, :link_speed, :sign_level]

  before_save do
    self.status = 'activo' if status == 'inactivo'
    if (low..mid).to_a.include?(issues_reports.count)
      self.priority = 'bajo'
    elsif (mid..high).to_a.include?(issues_reports.count)
      self.priority = 'medio'
    elsif issues_reports.count > high.to_i
      notify if notified
      self.priority = 'alto'
      self.notified = false
    end
    #binding.pry
  end

  def notify
    User.where(role: Role.first).each do |user|
      notification = Notification.new
      notification.user = user
      notification.notificable_id = id
      notification.notificable_type = "Issue"
      notification.save
    end
  end

  def low
    case category
    when 'ping'
      access_point.settings.low_ping
    when 'latency'
      access_point.settings.low_latency
    when 'jitter'
      access_point.settings.low_jitter
    when 'link_speed'
      access_point.settings.low_link_speed
    when 'sign_level'
      access_point.settings.low_sign_level
    end
  end

  def mid
    case category
    when 'ping'
      access_point.settings.mid_ping
    when 'latency'
      access_point.settings.mid_latency
    when 'jitter'
      access_point.settings.mid_jitter
    when 'link_speed'
      access_point.settings.mid_link_speed
    when 'sign_level'
      access_point.settings.mid_sign_level
    end
  end

  def high
    case category
    when 'ping'
      access_point.settings.high_ping
    when 'latency'
      access_point.settings.high_latency
    when 'jitter'
      access_point.settings.high_jitter
    when 'link_speed'
      access_point.settings.high_link_speed
    when 'sign_level'
      access_point.settings.high_sign_level
    end
  end

  after_create do
    comments.create(
      comment: "Caso aperturado",
      user: User.first
    )
  end
end
