class ZoneDevicesController < ApplicationController
  before_action :set_zone__device, only: [:show, :edit, :update, :destroy]

  # GET /zone__devices
  # GET /zone__devices.json
  def index
    @zone__devices = ZoneDevice.all
  end

  # GET /zone__devices/1
  # GET /zone__devices/1.json
  def show
  end

  # GET /zone__devices/new
  def new
    @zone__device = ZoneDevice.new
  end

  # GET /zone__devices/1/edit
  def edit
  end

  # POST /zone__devices
  # POST /zone__devices.json
  def create
    @zone__device = ZoneDevice.new(zone__device_params)

    respond_to do |format|
      if @zone__device.save
        format.html { redirect_to @zone__device, notice: 'Zone  device was successfully created.' }
        format.json { render :show, status: :created, location: @zone__device }
      else
        format.html { render :new }
        format.json { render json: @zone__device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zone__devices/1
  # PATCH/PUT /zone__devices/1.json
  def update
    respond_to do |format|
      if @zone__device.update(zone__device_params)
        format.html { redirect_to @zone__device, notice: 'Zone  device was successfully updated.' }
        format.json { render :show, status: :ok, location: @zone__device }
      else
        format.html { render :edit }
        format.json { render json: @zone__device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zone__devices/1
  # DELETE /zone__devices/1.json
  def destroy
    @zone__device.destroy
    respond_to do |format|
      format.html { redirect_to zone__devices_url, notice: 'Zone  device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone__device
      @zone__device = ZoneDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone__device_params
      params.require(:zone__device).permit(:access_point_id, :zone_id)
    end
end
