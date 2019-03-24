class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
    @mobile_points = Coordinate.where(locatable_type: "Mobile")
    @title = "Bienvenido"
    @icon = "home"
  end
end
