class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /data
  # GET /data.json
  def index
    @income =[]
    {}.tap do |result|
      Datum.last(50).group_by { |d| d.created_at.sec }.each do|t,datos|
        result['mobile'] = datos.first.mobile.mac_address
        datos.each do |dato|
          result[dato.type] = dato.value unless dato.type == "Ping"
          if dato.type == "Ping"
            result[dato.type] = "#{dato.percent}%"
            result['RTT'] = dato.rtt
          end
        end
        @income << result
      end
    end
    @income
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
