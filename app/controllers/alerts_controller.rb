class AlertsController < ApplicationController
  before_action :authenticate_user!
  before_action :settings, only: :edit
  # GET /alert
  # GET /alert.json
  def index
    @title = "Lista de Alarmas"
    @icon = "bell"

    @q = Issue.ransack(params[:q])
    @alerts = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
  end

  # GET /alert/1
  # GET /alert/1.json
  def show
    @issue = Issue.find(params[:id])
    @mobiles = @issue.issues_reports.map { |report| Datum.find(report.data_id).mobile }.uniq
  end

  def edit
    @title = "Configuración de Alarmas"
    @icon = "bell"
  end

  def save_setting
    Setting.min_jitter = params["min_jitter"]
    Setting.max_jitter = params["max_jitter"]
    Setting.min_ping = params["min_ping"]
    Setting.max_ping = params["max_ping"]
    Setting.min_latency = params["min_latency"]
    Setting.max_latency = params["max_latency"]
    Setting.min_link_speed = params["min_link_speed"]
    Setting.max_link_speed = params["max_link_speed"]
    Setting.min_sign_level = params["min_sign_level"]
    Setting.max_sign_level = params["max_sign_level"]
    Setting.tolerancia = params["tolerancia"]
    Setting.portal_url = params["portal_url"]
    Setting.portal_port = params["portal_port"]
    update_access_point_settings

    redirect_to alert_setting_path
  end

  def cerrar
    @issue = Issue.find(params[:alert_id])
    @issue.update_attribute(:status, :resuelto)

    redirect_to alerts_path
  end

  def cancelar
    @issue = Issue.find(params[:alert_id])
    @issue.update_attribute(:status, :cancelado)

    redirect_to alerts_path
  end

  private

  def update_access_point_settings
    ap_ids = params['zones']['zones_id'].select { |x| x unless x.empty? }

    ap_ids.each do |ap_id|
      ap = AccessPoint.find(ap_id)

      ap.settings.min_jitter = params["min_jitter"]
      ap.settings.max_jitter = params["max_jitter"]
      ap.settings.min_ping = params["min_ping"]
      ap.settings.max_ping = params["max_ping"]
      ap.settings.min_latency = params["min_latency"]
      ap.settings.max_latency = params["max_latency"]
      ap.settings.min_link_speed = params["min_link_speed"]
      ap.settings.max_link_speed = params["max_link_speed"]
      ap.settings.min_sign_level = params["min_sign_level"]
      ap.settings.max_sign_level = params["max_sign_level"]
    end
  end

  def settings
    @min_jitter = Setting.min_jitter
    @max_jitter = Setting.max_jitter
    @min_ping = Setting.min_ping
    @max_ping = Setting.max_ping
    @min_latency = Setting.min_latency
    @max_latency = Setting.max_latency
    @min_link_speed = Setting.min_link_speed
    @max_link_speed = Setting.max_link_speed
    @min_sign_level = Setting.min_sign_level
    @max_sign_level = Setting.max_sign_level
    @tolerancia = Setting.tolerancia
    @portal_url = Setting.portal_url
    @portal_port = Setting.portal_port
  end
end
