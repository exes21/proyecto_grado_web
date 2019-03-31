class Api::DataController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, :set_mobile, :set_access_point, only: :data_gather

  def data_gather
    data_params.map do |key, value|
      @mobile.datums.create(
        type: key.to_s.classify,
        value: value,
        access_point: @ap
      )
    end

    @mobile.coordinates.create(location_params)

    render status: 200, json: @mobile.to_json
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
      render json: {status: 'error', code: '500'}
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
    Coordinate.where('locatable_type = ? AND created_at < ?','Mobile', 2.minute.ago).uniq { |c| c.locatable_id }.each do |u|
      {}.tap do |user|
        mobile = Mobile.find(u.locatable_id)
        datos = mobile.datums.last(5)
        binding.pry
        
        user[:ssid] = 
        user[:ip] = u.ip_address
        user[:mac] = mobile..mac_address
        user[:latitude] = u.latitude
        user[:longitude] = u.longitude
        user[:ping]
        user[:latency]
        user[:jitter]
        user[:link_speed]
        user[:sign_level]
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
      ping: params["xPing"],
      latency: params["latency"],
      jitter: params["jitter"],
      link_speed: params["LinkSpeed"],
      sign_level: params["SignLevel"]
    }
  end

  def set_user
    @user = User.find_by(email: params["mail"])
  end

  def set_mobile
    @mobile = @user.mobiles.find_or_create_by(
                                        mac_address: params["MacAddress"]
                                      )
  end

  def set_access_point
    @ap = AccessPoint.find_by(
                              ssid: JSON.parse(params["ssid"]),
                              ip_address: (params["DefaultGate"].reverse)
                            )
  end
end
