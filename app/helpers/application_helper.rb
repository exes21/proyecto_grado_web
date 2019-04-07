module ApplicationHelper
  def status_color(status)
    case status
    when 'inactivo' then return 'active'
    when 'activo' then return 'danger'
    when 'cancelado' then return 'alert'
    when 'resuelto' then return 'success'
    end
  end
end
