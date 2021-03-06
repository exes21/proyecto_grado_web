class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /zones
  # GET /zones.json
  def index
    @zones = Zone.all.paginate(page: params[:page], per_page: 10)
    @title = "Configuración de areas"
  end

  # GET /zones/1
  # GET /zones/1.json
  def show
    @title = "Mostrar areas"
    @datos = Datum.where(access_point_id: @zone.access_points.pluck(:id)).group_by { |d| d.type }
  end

  # GET /zones/new
  def new
    @zone = Zone.new
    @title = "Nueva areas"
  end

  # GET /zones/1/edit
  def edit
    @title = "Editar area"
  end

  # POST /zones
  # POST /zones.json
  def create
    @zone = Zone.new(zone_params)

    respond_to do |format|
      if @zone.save
        save_coordinates
        format.html { redirect_to zones_url, notice: 'Zone was successfully created.' }
        format.json { render :show, status: :created, location: @zone }
      else
        format.html { render :new }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zones/1
  # PATCH/PUT /zones/1.json
  def update
    respond_to do |format|
      if @zone.update(zone_params)
        save_coordinates
        format.html { redirect_to zones_url, notice: 'Zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @zone }
      else
        format.html { render :edit }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1
  # DELETE /zones/1.json
  def destroy
    @zone.destroy
    respond_to do |format|
      format.html { redirect_to zones_url, notice: 'Zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def save_coordinates
      @zone.coordinates.destroy_all
      JSON.parse(params[:coordinates]).each do |lat, lng|
        @zone.coordinates.create(
          latitude: lat,
          longitude: lng
        )
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit( :id,
                                    :name,
                                    :description,
                                    coordinates_attributes:[
                                      :latitude,
                                      :longitude
                                    ]
                                  )
    end
end
