class StationsController < ApplicationController
  def show
    @station = Station.find(params[:id])
  end

  def flow
    @station = Station.find(params[:id])
    @departures = Hash.new(0)
    @arrivals = Hash.new(0)
    @station.departures.each{|trip| @departures[trip.departed_at.strftime("%H:%M")] += 1 }
    @station.arrivals.each{|trip| @arrivals[trip.arrived_at.strftime("%H:%M")] += 1 }
  end
end
