class PortalController < ApplicationController
  layout "empty"
  def index
  end

  def show
    send_file(
      "#{Rails.root}/public/iarw.apk",
      filename: "iarw.apk",
      type: "application/apk"
    )
  end
end
