class ReportsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @datos = Datum.all.group_by(&:type)

    respond_to do |format|
      format.html
      format.json do
        results = {}
        results.tap do |content|
          @datos.map do |type, value|
            order_by_ap = value.group_by(&:access_point)

            content[type.underscore] = order_by_ap.map do |ap|
              values_array = ap[1].pluck(:type).first == 'Ping' ? ap[1].map(&:average) : ap[1].pluck(:value)
              [
                ap[0].ssid,
                values_array.sum { |n| n.to_i } / values_array.size,
                measure_for(type)
              ]
            end
          end
        end

        render json: results.to_json
      end
    end
  end
end
