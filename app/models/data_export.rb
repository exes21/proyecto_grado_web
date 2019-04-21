class DataExport
  include LpCSVExportable::CanExportAsCSV

  column :created_at
  column :dato, model_method: :type
  column :valor, model_method: :value
  column :ap_ssid, model_method: :ssid
  column :ap_mac, model_method: :mac_address
  column :ap_ip, model_method: :ip

  def ssid(ap)
    ap.access_point.ssid
  end

  def mac_address(ap)
    ap.access_point.mac_address
  end

  def ip(ap)
    ap.access_point.ip_address
  end

end
