class Datum < ApplicationRecord
  belongs_to :mobile
  belongs_to :access_point
  has_one :issues_report

  delegate :name, to: :access_point, prefix: true
end

class Ping < Datum
  after_save do
    unless (access_point.settings.min_ping.to_i..access_point.settings.max_ping.to_i).to_a.include?(rtt.min)
      issue = Issue.find_or_create_by(access_point: access_point, status: "activo", category: 'ping')
      issue.update_attribute(:updated_at, Time.now)
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end

  def statuses
    ActiveSupport::JSON.decode(value)['status']
  end

  def percent
    return ((completed.to_f / statuses.count) * 100)
  end

  def rejected
    statuses.select { |s| s == 'TtlExpired' }.count
  end

  def completed
    statuses.select { |s| s == 'Success' }.count
  end

  def package_loss
    return ((rejected.to_f / statuses.count) * 100)
  end

  def average
    rtt = ActiveSupport::JSON.decode(value)['rtt']
    rtt.inject(0.0) { |sum, el| sum + el } / rtt.size
  end

  def status
    ActiveSupport::JSON.decode(value)['status'].uniq.first
  end

  def rtt
    ActiveSupport::JSON.decode(value)['rtt']
  end
end

class Latency < Datum
  after_save do
    unless (access_point.settings.min_latency.to_i..access_point.settings.max_latency.to_i).to_a.include?(value.to_i)
      issue = Issue.find_or_create_by(access_point: access_point, status: "activo", category: 'latency')
      issue.update_attribute(:updated_at, Time.now)
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end
class Jitter < Datum
  after_save do
    unless (access_point.settings.min_jitter.to_i..access_point.settings.max_jitter.to_i).to_a.include?(value.to_i)
      issue = Issue.find_or_create_by(access_point: access_point, status: "activo", category: 'jitter')
      issue.update_attribute(:updated_at, Time.now)
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end

class LinkSpeed < Datum
  after_save do
    unless (access_point.settings.min_link_speed.to_i..access_point.settings.max_link_speed.to_i).to_a.include?(value.to_i)
      issue = Issue.find_or_create_by(access_point: access_point, status: "activo", category: 'link_speed')
      issue.update_attribute(:updated_at, Time.now)
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end

class SignLevel < Datum
  after_save do
    unless (access_point.settings.min_sign_level.to_i..access_point.settings.max_sign_level.to_i).to_a.include?(value.to_i)
      issue = Issue.find_or_create_by(access_point: access_point, status: "activo", category: 'sign_level')
      issue.update_attribute(:updated_at, Time.now)
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end
