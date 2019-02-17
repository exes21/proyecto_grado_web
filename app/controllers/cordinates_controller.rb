class CordinatesController < ApplicationController
  before_action :set_cordinate, only: [:show, :edit, :update, :destroy]

  # GET /cordinates
  # GET /cordinates.json
  def index
    @cordinates = Cordinate.all
  end

  # GET /cordinates/1
  # GET /cordinates/1.json
  def show
  end

  # GET /cordinates/new
  def new
    @cordinate = Cordinate.new
  end

  # GET /cordinates/1/edit
  def edit
  end

  # POST /cordinates
  # POST /cordinates.json
  def create
    @cordinate = Cordinate.new(cordinate_params)

    respond_to do |format|
      if @cordinate.save
        format.html { redirect_to @cordinate, notice: 'Cordinate was successfully created.' }
        format.json { render :show, status: :created, location: @cordinate }
      else
        format.html { render :new }
        format.json { render json: @cordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cordinates/1
  # PATCH/PUT /cordinates/1.json
  def update
    respond_to do |format|
      if @cordinate.update(cordinate_params)
        format.html { redirect_to @cordinate, notice: 'Cordinate was successfully updated.' }
        format.json { render :show, status: :ok, location: @cordinate }
      else
        format.html { render :edit }
        format.json { render json: @cordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cordinates/1
  # DELETE /cordinates/1.json
  def destroy
    @cordinate.destroy
    respond_to do |format|
      format.html { redirect_to cordinates_url, notice: 'Cordinate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cordinate
      @cordinate = Cordinate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cordinate_params
      params.require(:cordinate).permit(:latitude, :longitude)
    end
end
