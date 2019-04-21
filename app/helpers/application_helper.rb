module ApplicationHelper
  def status_color(status)
    case status
    when 'irrelevante' then return 'active'
    when 'bajo' then return 'success'
    when 'medio' then return 'warning'
    when 'alto' then return 'danger'
    end
  end

  def measure_for(type)
    case type
    when 'Ping' then return 'ms'
    when 'Jitter' then return 'ms'
    when 'Latency' then return 'ms'
    when 'LinkSpeed' then return 'Mb/s'
    when 'SignLevel' then return 'dBm'
    end
  end
end
