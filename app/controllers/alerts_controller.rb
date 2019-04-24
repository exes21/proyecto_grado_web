class AlertsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :settings, only: :edit
  before_action :issue, except: [:index, :edit, :save_setting]
  # GET /alert
  # GET /alert.json
  def index
    @title = "Lista de alarmas"
    @icon = "bell"

    @q = Issue.ransack(params[:q])
    @alerts = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv do
        export = ErrorsExport.new
        export.collection = @alerts
        send_data export.to_csv
      end
    end
  end

  def notificar
    notification = Notification.new
    notification.user = current_user
    notification.notificable_id = @issue.id
    notification.notificable_type = "Issue"
    notification.save
    redirect_to alert_path(@issue)
  end

  # GET /alert/1
  # GET /alert/1.json
  def show
    @mobiles = @issue.issues_reports.map { |report| Datum.find(report.data_id).mobile }.uniq
    @coordinates = @mobiles.map { |m| m.coordinates.map { |c| [c.latitude.to_f, c.longitude.to_f] } }
  end

  def edit
    @title = "Configuración de alarmas"
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

    Setting.low_jitter = params["low_jitter"]
    Setting.mid_jitter = params["mid_jitter"]
    Setting.high_jitter = params["high_jitter"]
    Setting.low_ping = params["low_ping"]
    Setting.mid_ping = params["mid_ping"]
    Setting.high_ping = params["high_ping"]
    Setting.low_latency = params["low_latency"]
    Setting.mid_latency = params["mid_latency"]
    Setting.high_latency = params["high_latency"]
    Setting.low_link_speed = params["low_link_speed"]
    Setting.mid_link_speed = params["mid_link_speed"]
    Setting.high_link_speed = params["high_link_speed"]
    Setting.low_sing_level = params["low_sing_level"]
    Setting.mid_sing_level = params["mid_sing_level"]
    Setting.high_link_speed = params["high_link_speed"]
    update_access_point_settings

    redirect_to alert_setting_path
  end

  def cerrar
    @issue.update_attribute(:status, :resuelto)
    @issue.update_attribute(:solved_at, Time.now)
    @issue.comments.create(
      user: User.find(params[:user]),
      comment: params[:comment]
    )
    redirect_to alert_path(@issue)
  end

  def cancelar
    @issue.update_attribute(:status, :cancelado)
    @issue.comments.create(
      user: User.find(params[:user]),
      comment: params[:comment]
    )

    redirect_to alert_path(@issue)
  end

  def comentar
    @issue.comments.create(
      user: User.find(params[:user]),
      comment: params[:comment]
    )
    redirect_to alert_path(@issue)
  end

  private

  def issue
    @issue = Issue.find(params[:alert_id] || params[:id])
  end

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

      ap.settings.low_jitter = params["low_jitter"]
      ap.settings.mid_jitter = params["mid_jitter"]
      ap.settings.high_jitter = params["high_jitter"]
      ap.settings.low_ping = params["low_ping"]
      ap.settings.mid_ping = params["mid_ping"]
      ap.settings.high_ping = params["high_ping"]
      ap.settings.low_latency = params["low_latency"]
      ap.settings.mid_latency = params["mid_latency"]
      ap.settings.high_latency = params["high_latency"]
      ap.settings.low_link_speed = params["low_link_speed"]
      ap.settings.mid_link_speed = params["mid_link_speed"]
      ap.settings.high_link_speed = params["high_link_speed"]
      ap.settings.low_sing_level = params["low_sing_level"]
      ap.settings.mid_sing_level = params["mid_sing_level"]
      ap.settings.high_sing_level = params["high_sing_level"]
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

    @low_jitter = Setting.low_jitter
    @mid_jitter = Setting.mid_jitter
    @high_jitter = Setting.high_jitter
    @low_ping = Setting.low_ping
    @mid_ping = Setting.mid_ping
    @high_ping = Setting.high_ping
    @low_latency = Setting.low_latency
    @mid_latency = Setting.mid_latency
    @high_latency = Setting.high_latency
    @low_link_speed = Setting.low_link_speed
    @mid_link_speed = Setting.mid_link_speed
    @high_link_speed = Setting.high_link_speed
    @low_sing_level = Setting.low_sing_level
    @mid_sing_level = Setting.mid_sing_level
    @high_sing_level = Setting.high_sing_level
  end
end
