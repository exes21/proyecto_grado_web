class Datum < ApplicationRecord
  belongs_to :mobile
  belongs_to :access_point
  has_one :issues_report
end

class Ping < Datum
  after_save do
    unless [access_point.settings.min_ping..access_point.settings.max_ping].include?(value)
      issue = Issue.find_or_create_by(access_point: access_point, status: "inactivo")
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end

  def percent
    status = ActiveSupport::JSON.decode(value)['status']
    completed = status.select { |s| s == 'Success' }.count
    return (status.count / completed) * 100
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
    unless [access_point.settings.min_latency..access_point.settings.max_latency].include?(value)
      issue = Issue.find_or_create_by(access_point: access_point, status: "inactivo")
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end
class Jitter < Datum
  after_save do
    unless [access_point.settings.min_jitter..access_point.settings.max_jitter].include?(value)
      issue = Issue.find_or_create_by(access_point: access_point, status: "inactivo")
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end
class LinkSpeed < Datum
  after_save do
    unless [access_point.settings.min_link_speed..access_point.settings.max_link_speed].include?(value)
      issue = Issue.find_or_create_by(access_point: access_point, status: "inactivo")
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end

class SignLevel < Datum
  after_save do
    unless [access_point.settings.min_sign_level..access_point.settings.max_sign_level].include?(value)
      issue = Issue.find_or_create_by(access_point: access_point, status: "inactivo")
      issue.issues_reports.find_or_create_by(data_id: id)
    end
  end
end
