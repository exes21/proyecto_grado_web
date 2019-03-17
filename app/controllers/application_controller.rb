class ApplicationController < ActionController::Base
  before_action :load_and_authorize_resource
  before_action :load_permissions
end
