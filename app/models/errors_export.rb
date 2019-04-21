class ErrorsExport
  include LpCSVExportable::CanExportAsCSV

  column :created_at
  column :ap_ssid, model_method: :ssid
  column :ap_mac, model_method: :mac_address
  column :ap_ip, model_method: :ip
  column :prioridad, model_method: :priority
  column :eventos, model_method: :notifications
  column :estado, model_method: :status
  column :categoria, model_method: :category

  def ssid(ap)
    ap.access_point.ssid
  end

  def status(ap)
    ap.status
  end

  def priority(ap)
    ap.priority
  end

  def category(ap)
    ap.category
  end

  def mac_address(ap)
    ap.access_point.mac_address
  end

  def ip(ap)
    ap.access_point.ip_address
  end

  def notifications(ap)
    ap.issues_reports.count
  end
end
