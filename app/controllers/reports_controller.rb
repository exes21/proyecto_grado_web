class ReportsController < ApplicationController
  def index
    @pings = Datum.where(type: 'Ping')
    @link_speeds = Datum.where(type: 'LinkSpeed')
    @latencies = Datum.where(type: 'Latency')
    @sign_levels = Datum.where(type: 'SignLevel')
  end
end
