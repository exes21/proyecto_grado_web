class Api::DataController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, :set_mobile, :set_access_point

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
    # TODO: verificar problema con la busqueda
    @ap = AccessPoint.find_by(
                              ssid: JSON.parse(params["ssid"]),
                              ip_address: (params["DefaultGate"].reverse!)
                            )
  end
end
