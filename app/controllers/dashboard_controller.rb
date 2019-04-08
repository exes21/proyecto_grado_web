class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
    @mobile_points = Coordinate.where(locatable_type: "Mobile")
    @title = "Bienvenido"
    @icon = "home"

    @datos = Issue.where(status: 'inactivo').last(10)
  end
end
