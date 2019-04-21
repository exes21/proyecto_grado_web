module ApplicationHelper
  def status_color(status)
    case status
    when 'irrelevante' then return 'active'
    when 'bajo' then return 'success'
    when 'medio' then return 'warning'
    when 'alto' then return 'danger'
    end
  end
end
