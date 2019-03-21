class CoordinatesController < ApplicationController

  def index
    # @reports = Datum.where('created_at < ?', 1.minute.ago).group_by { |d| d.mobile  }
    # result = {}.tap do |result|
    #   @reports.each do |mobile, datos|
    #     result[:mobile] = mobile
    #     result[:user] =   mobile.user
    #     result[:datos] =  datos.uniq { |d| d.type }
    #     result[:location] = mobile.coordinates.last
    #   end
    # end

    reports = Coordinate.where('locatable_type = "Mobile" and coordinates.created_at < ?', 1.minute.ago)
    reports = reports.uniq { |l| l.locatable_id }

    result = {}.tap do |result|
      reports.each do |location|
        mobile = Mobile.find(location.locatable_id)
        result[:mobile] = mobile
        result[:location] = location
        result[:data] = mobile.datums.last(5)
        result[:user] = mobile.user
      end
    end

    render json: result.to_json
  end

end
