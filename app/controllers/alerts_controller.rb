class AlertsController < ApplicationController
 before_action :authenticate_user!

  # GET /alert
  # GET /alert.json
  def index
    @alert = Issue.all
    @title = "Lista de Alarmas"
    @icon = "bell"
  end

  # GET /alert/1
  # GET /alert/1.json
  def show
    
  end
  
  def setting
    @title = "Configuración de Alarmas"
    @icon = "bell"
  end

  def save_setting
  end
end
