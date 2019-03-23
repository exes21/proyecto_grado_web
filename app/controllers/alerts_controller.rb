class AlertsController < ApplicationController
 before_action :authenticate_user!

  # GET /alert
  # GET /alert.json
  def index
    @alert = Issue.all
  end

  # GET /alert/1
  # GET /alert/1.json
  def show
    
  end
  
end
