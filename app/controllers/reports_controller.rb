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
              list = ap[1].map {|d| [d.id, d.type == "Ping" ? d.package_loss : d.value, d.access_point.ssid]}
              [
                ap[0].ssid,
                list.inject(0){|sum,x| sum + x[1].to_i } / list.count,
                measure_for(type),
                list
              ]
            end
          end
        end

        render json: results.to_json
      end
    end
  end
end
