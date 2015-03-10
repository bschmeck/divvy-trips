class StationsController < ApplicationController
  def show
    @station = Station.find(params[:id])
  end

  def flow
    @station = Station.find(params[:id])
    @departures = Hash.new(0)
    @arrivals = Hash.new(0)
    @station.departures.pluck(:departed_at).each{|t| @departures[t.strftime("%H:%M")] += 1 }
    @station.arrivals.pluck(:arrived_at).each{|t| @arrivals[t.strftime("%H:%M")] += 1 }
  end
end
