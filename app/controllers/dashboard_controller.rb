class DashboardController < ApplicationController
  def home
    @mobile_points = Coordinate.where(locatable_type: "Mobile")
  end
end
