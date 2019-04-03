class Datum < ApplicationRecord
  belongs_to :mobile
  belongs_to :access_point
  has_many :issues, as: :reportable
end

class Ping < Datum

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

  after_save do
    unless [access_point.settings.min_ping..access_point.settings.max_ping].include?(value)
      issues.create(
        description: 'El ping esta fuera de los parametros',
        since: Time.now,
        access_point: access_point,
      )
    end
  end
end

class Latency < Datum
  after_save do
    unless [access_point.settings.min_latency..access_point.settings.max_latency].include?(value)
      issues.create(
        description: 'La Latencia esta fuera de los parametros',
        since: Time.now,
        access_point: access_point
      )
    end
  end
end
class Jitter < Datum
  after_save do
    unless [access_point.settings.min_jitter..access_point.settings.max_jitter].include?(value)
      issues.create(
        description: 'El jitter esta fuera de los parametros',
        since: Time.now,
        access_point: access_point
      )
    end
  end
end
class LinkSpeed < Datum
  after_save do
    unless [access_point.settings.min_link_speed..access_point.settings.max_link_speed].include?(value)
      issues.create(
        description: 'La velocidad de enlace esta fuera de los parametros',
        since: Time.now,
        access_point: access_point
      )
    end
  end
end

class SignLevel < Datum
  after_save do
    unless [access_point.settings.min_sign_level..access_point.settings.max_sign_level].include?(value)
      issues.create(
        description: 'El nivel de senal esta fuera de los parametros',
        since: Time.now,
        access_point: access_point
      )
    end
  end
end
