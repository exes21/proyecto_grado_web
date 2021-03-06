class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :notifications
  before_action :base_config

  #layout :layout_by_resource
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path and return
  end


  protected

  def measure_for(type)
    case type
    when 'Ping' then return 'ms'
    when 'Jitter' then return 'ms'
    when 'Latency' then return 'ms'
    when 'LinkSpeed' then return 'Mb/s'
    when 'SignLevel' then return 'dBm'
    end
  end

  def base_config
    unless Setting.center.present?
      redirect_to general_settings_form_path
    end
  end

  def notifications
    @notifications = Notification.where(user: current_user)
  end

  #derive the model name from the controller. egs UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  #load the permissions for the current user so that UI can be manipulated
  def load_permissions
    @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  end

  # def layout_by_resource
  #   if devise_controller?
  #     "devise"
  #   else
  #     "application"
  #   end
  # end
end
