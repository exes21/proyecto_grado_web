class AccessPointsController < ApplicationController
  before_action :set_access_point, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /access_points
  # GET /access_points.json
  def index
    @access_points = AccessPoint.all
  end

  # GET /access_points/1
  # GET /access_points/1.json
  def show
  end

  # GET /access_points/new
  def new
    @access_point = AccessPoint.new
    @access_point.coordinate.build
  end

  # GET /access_points/1/edit
  def edit
    @access_point.build_coordinate
  end

  # POST /access_points
  # POST /access_points.json
  def create
    @access_point = AccessPoint.new(access_point_params)

    respond_to do |format|
      if @access_point.save
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
    binding.pry
    respond_to do |format|
      if @access_point.update(access_point_params)
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
                                              :latitude,
                                              :longitude,
                                              :locatable_id
                                            ]
      )
    end

end
