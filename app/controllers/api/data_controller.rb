class Api::DataController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, 
                :set_mobile, 
                :set_access_point, only: :data_gather

  def data_gather
    data_params.map do |key, value|
      @mobile.datums.create(
        type: key.to_s.classify,
        value: value,
        access_point: @ap
      )
    end

    @mobile.coordinates.create(location_params)

    render status: 200, json: { status: 200,
      info: @mobile.to_json }
  end

  def zone_save_limits
    zone = Zone.find(params[:id])
    zone.coordinates.destroy_all
    params[:points].each do |k,v|
      Coordinate.create(
        latitude: v[0],
        longitude: v[1],
        locatable_type: 'Zone',
        locatable_id: zone.id
      )
    end
  end

  def zone
    zone = Zone.find(params[:id])
    if zone.present?

      render json: zone.coordinates.map { |c| [c.latitude, c.longitude] }.to_json, status: :ok
    else
      render json: {status: 'error'}, status: 409
    end
  end

  def zones
    zone_list = []
    Zone.all.each do |z|
      {}.tap do |list|
        list[:zone] = z.name
        list[:limits] = z.coordinates.map { |z| [z.latitude, z.longitude] }
        zone_list << list
      end
    end
    render json: zone_list.to_json
  end


  def access_points
    ap_list = []
    AccessPoint.all.each do |ap|
      {}.tap do |list|
        list[:ssid] = ap.ssid
        list[:ip] = ap.ip_address
        list[:mac] = ap.mac_address
        list[:latitude] = ap.latitude
        list[:longitude] = ap.longitude
        ap_list << list
      end
    end
    render json: ap_list.to_json
  end

  def last_connected_users
    list = []
    Coordinate.where('locatable_type = ? AND created_at > ?','Mobile', 2.minutes.ago).uniq { |c| c.locatable_id }.each do |u|
      {}.tap do |user|
        mobile = Mobile.find(u.locatable_id)
        datos = mobile.datums.last(5)
        user[:user] = mobile.user.email
        user[:ssid] = datos.first.access_point.ssid
        user[:ip] = datos.first.access_point.ip_address
        user[:mac] = mobile.mac_address
        user[:latitude] = u.latitude
        user[:longitude] = u.longitude
        ping = datos.select { |d| d.type == 'Ping' }.first
        user[:ping] = ping.try(:status)
        user[:rtt] = ping.try(:rtt)
        user[:latency] = datos.select { |d| d.type == 'Latency' }.first.value
        user[:jitter] = datos.select { |d| d.type == 'Jitter' }.first.value
        user[:link_speed] = datos.select { |d| d.type == 'LinkSpeed' }.first.value
        user[:sign_level] = datos.select { |d| d.type == 'SignLevel' }.first.value
        list << user
      end
    end

    render json: list.to_json
  end

  private

  def location_params
    [
      latitude: params["lat"],
      longitude: params["lng"]
    ]
  end

  def data_params
    {
      ping: {
        status: params['status'],
        rtt: params['RTT'],
        address: params['address']
      }.to_json,
      latency: params["lantency"],
      jitter: params["jitter"],
      link_speed: params["LinkSpeed"],
      sign_level: params["SignLevel"]
    }
  end

  def set_user
    @user = User.find_by(email: params["mail"])
    if @user.present? && @user.valid_password?(params['pass'])
      begin
        ApConnect.new.autorize(params["MacAddress"])
      rescue => ex
        logger.error ex.message
      end
    else
      render json: { message: 'Usuario invalido' }, status: 401
    end
  end

  def set_mobile
    @mobile = @user.mobiles.find_or_create_by(
                                        mac_address: params["MacAddress"]
                                      )
  end

  def set_access_point
    @ap = AccessPoint.find_by(ssid: JSON.parse(params['ssid']))
          ApChannel.find_by(bssid: params['MacDelRouter']).try(:access_point) ||
          AccessPoint.find_by(ip_address: params["DefaultGate"].split('.').reverse.join('.')) ||
          AccessPoint.find_by(mac_address: params['MacDelRouter']) ||

    unless @ap.present?
      render json: { message: 'AP no encontrado' }, status: 403
    end
  end
end