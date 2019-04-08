class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /data
  # GET /data.json
  def index
    @q = Datum.ransack(params[:q])
    @q.sorts = "created_at desc"
    @income = @q.result(distinct: true).paginate(page: params[:page], per_page: 50)
  end

  # GET /data/1
  # GET /data/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datum_params
      params.require(:datum).permit(:mobile_id, :type, :value)
    end
end
