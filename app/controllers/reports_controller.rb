class ReportsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    if params[:desde].present?
      case params[:desde].to_i
      when 1
        @q = Datum.where("created_at > ?", 5.minutes.ago)
      when 2
        @q = Datum.where("created_at > ?", 10.minutes.ago)
      when 3
        @q = Datum.where("created_at > ?", 15.minutes.ago)
      when 4
        @q = Datum.where("created_at > ?", 30.minutes.ago)
      when 5
        @q = Datum.where("created_at > ?", 1.hour.ago)
      when 6
        @q = Datum.where("created_at > ?", 12.hours.ago)
      when 7
        @q = Datum.where("created_at > ?", 24.hours.ago)
      when 8
        @q = Datum.where("created_at > ?", 7.days.ago)
      when 9
        @q = Datum.where("created_at > ?", 30.days.ago)
      else
        @q = Datum.all
      end

    else
      @q = Datum.all
    end

    @datos = @q.group_by(&:type)

    respond_to do |format|
      format.html
      format.json do
        results = {}
        results.tap do |content|
          @datos.map do |type, value|
            order_by_ap = value.group_by(&:access_point)

            content[type.underscore] = order_by_ap.map do |ap|
              values_array = ap[1].pluck(:type).first == 'Ping' ? ap[1].map(&:package_loss) : ap[1].pluck(:value)
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
