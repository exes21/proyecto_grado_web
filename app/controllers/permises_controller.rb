class PermisesController < ApplicationController
  before_action :set_permise, only: [:show, :edit, :update, :destroy]

  # GET /permises
  # GET /permises.json
  def index
    @permises = Permise.all
  end

  # GET /permises/1
  # GET /permises/1.json
  def show
  end

  # GET /permises/new
  def new
    @permise = Permise.new
  end

  # GET /permises/1/edit
  def edit
  end

  # POST /permises
  # POST /permises.json
  def create
    @permise = Permise.new(permise_params)

    respond_to do |format|
      if @permise.save
        format.html { redirect_to @permise, notice: 'Permise was successfully created.' }
        format.json { render :show, status: :created, location: @permise }
      else
        format.html { render :new }
        format.json { render json: @permise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permises/1
  # PATCH/PUT /permises/1.json
  def update
    respond_to do |format|
      if @permise.update(permise_params)
        format.html { redirect_to @permise, notice: 'Permise was successfully updated.' }
        format.json { render :show, status: :ok, location: @permise }
      else
        format.html { render :edit }
        format.json { render json: @permise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permises/1
  # DELETE /permises/1.json
  def destroy
    @permise.destroy
    respond_to do |format|
      format.html { redirect_to permises_url, notice: 'Permise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permise
      @permise = Permise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permise_params
      params.require(:permise).permit(:object, :method)
    end
end
