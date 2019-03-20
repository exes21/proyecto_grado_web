class GeneralSettingsController < ApplicationController
  protect_from_forgery with: :null_session

  def form
  end

  def save
    Setting.limits = params[:points]
    render status: 200
  end

  def limits
    render status: 200, json: Setting.limits.to_json
  end
end
