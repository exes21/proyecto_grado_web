class AccessPointsController < ApplicationController
  before_action :set_access_point, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /access_points
  # GET /access_points.json
  def index
    @access_points = AccessPoint.all.paginate(page: params[:page], per_page: 10)
    @title = "Configuración de equipos"
    @icon = "wifi"
  end

  # GET /access_points/1
  # GET /access_points/1.json
  def show
    @title = "Vista de equipos"
    @icon = "wifi"
  end

  # GET /access_points/new
  def new
    @access_point = AccessPoint.new
    @access_point.build_coordinate
    @access_point.channels.new
    @title = "Nuevo equipo"
    @icon = "wifi"

    @min_jitter = @access_point.settings.min_jitter
    @max_jitter = @access_point.settings.max_jitter
    @min_ping = @access_point.settings.min_ping
    @max_ping = @access_point.settings.max_ping
    @min_latency = @access_point.settings.min_latency
    @max_latency = @access_point.settings.max_latency
    @min_link_speed = @access_point.settings.min_link_speed
    @max_link_speed = @access_point.settings.max_link_speed
    @min_sign_level = @access_point.settings.min_sign_level
    @max_sign_level = @access_point.settings.max_sign_level
    @distance = @access_point.settings.distance
    @low_jitter = @access_point.settings.low_jitter
    @mid_jitter = @access_point.settings.mid_jitter
    @high_jitter = @access_point.settings.high_jitter
    @low_ping = @access_point.settings.low_ping
    @mid_ping = @access_point.settings.mid_ping
    @high_ping = @access_point.settings.high_ping
    @low_latency = @access_point.settings.low_latency
    @mid_latency = @access_point.settings.mid_latency
    @high_latency = @access_point.settings.high_latency
    @low_link_speed = @access_point.settings.low_link_speed
    @mid_link_speed = @access_point.settings.mid_link_speed
    @high_link_speed = @access_point.settings.high_link_speed
    @low_sing_level = @access_point.settings.low_sing_level
    @mid_sing_level = @access_point.settings.mid_sing_level
    @high_link_speed = @access_point.settings.high_link_speed
  end

  # GET /access_points/1/edit
  def edit
    @title = "Editar equipo"
    @icon = "wifi"
  end

  # POST /access_points
  # POST /access_points.json
  def create
    @access_point = AccessPoint.new(access_point_params)
    @access_point.channels.new(bssid: @access_point.mac_address)
    respond_to do |format|
      if @access_point.save
        update_settings
        format.html { redirect_to @access_point, notice: 'Access point was successfully created.' }
        format.json { render :show, status: :created, location: @access_point }
      else
        format.html { render :new }
        format.json { render json: @access_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_points/1
  # PATCH/PUT /access_points/1.json
  def update
    respond_to do |format|
      if @access_point.update_attributes(access_point_params)
        update_settings
        format.html { redirect_to @access_point, notice: 'Access point was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_point }
      else
        format.html { render :edit }
        format.json { render json: @access_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_points/1
  # DELETE /access_points/1.json
  def destroy
    @access_point.destroy
    respond_to do |format|
      format.html { redirect_to access_points_url, notice: 'Access point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_point
      @access_point = AccessPoint.find(params[:id])

      @min_jitter = @access_point.settings.min_jitter
      @max_jitter = @access_point.settings.max_jitter
      @min_ping = @access_point.settings.min_ping
      @max_ping = @access_point.settings.max_ping
      @min_latency = @access_point.settings.min_latency
      @max_latency = @access_point.settings.max_latency
      @min_link_speed = @access_point.settings.min_link_speed
      @max_link_speed = @access_point.settings.max_link_speed
      @min_sign_level = @access_point.settings.min_sign_level
      @max_sign_level = @access_point.settings.max_sign_level
      @distance = @access_point.settings.distance
      @low_jitter = @access_point.settings.low_jitter
      @mid_jitter = @access_point.settings.mid_jitter
      @high_jitter = @access_point.settings.high_jitter
      @low_ping = @access_point.settings.low_ping
      @mid_ping = @access_point.settings.mid_ping
      @high_ping = @access_point.settings.high_ping
      @low_latency = @access_point.settings.low_latency
      @mid_latency = @access_point.settings.mid_latency
      @high_latency = @access_point.settings.high_latency
      @low_link_speed = @access_point.settings.low_link_speed
      @mid_link_speed = @access_point.settings.mid_link_speed
      @high_link_speed = @access_point.settings.high_link_speed
      @low_sing_level = @access_point.settings.low_sing_level
      @mid_sing_level = @access_point.settings.mid_sing_level
      @high_link_speed = @access_point.settings.high_link_speed
    end

    def update_settings
      @access_point.settings.min_jitter = params[:min_jitter]
      @access_point.settings.max_jitter = params[:max_jitter]
      @access_point.settings.min_ping = params[:min_ping]
      @access_point.settings.max_ping = params[:max_ping]
      @access_point.settings.min_latency = params[:min_latency]
      @access_point.settings.max_latency = params[:max_latency]
      @access_point.settings.min_link_speed = params[:min_link_speed]
      @access_point.settings.max_link_speed = params[:max_link_speed]
      @access_point.settings.min_sign_level = params[:min_sign_level]
      @access_point.settings.max_sign_level = params[:max_sign_level]
      @access_point.settings.distance = params[:distance]

      @access_point.settings.low_jitter = params["low_jitter"]
      @access_point.settings.mid_jitter = params["mid_jitter"]
      @access_point.settings.high_jitter = params["high_jitter"]
      @access_point.settings.low_ping = params["low_ping"]
      @access_point.settings.mid_ping = params["mid_ping"]
      @access_point.settings.high_ping = params["high_ping"]
      @access_point.settings.low_latency = params["low_latency"]
      @access_point.settings.mid_latency = params["mid_latency"]
      @access_point.settings.high_latency = params["high_latency"]
      @access_point.settings.low_link_speed = params["low_link_speed"]
      @access_point.settings.mid_link_speed = params["mid_link_speed"]
      @access_point.settings.high_link_speed = params["high_link_speed"]
      @access_point.settings.low_sing_level = params["low_sing_level"]
      @access_point.settings.mid_sing_level = params["mid_sing_level"]
      @access_point.settings.high_link_speed = params["high_link_speed"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_point_params
      params.require(:access_point).permit( :id,
                                            :ssid,
                                            :ip_address,
                                            :mac_address,
                                            :user,
                                            :password,
                                            :zone_id,
                                            coordinate_attributes: [
                                              :id,
                                              :latitude,
                                              :longitude,
                                              :locatable_id
                                            ],
                                            channels_attributes: [
                                              :id,
                                              :bssid
                                            ]
      )
    end

end
