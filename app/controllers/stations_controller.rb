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

  def predict
    @station = Station.find(params[:id])
    @status = Divvy::API.live_status(@station.divvy_id)
    @basis_date = 2.days.ago - 6.hours

    current_seconds = @basis_date.hour * 3600 + @basis_date.min * 60 + @basis_date.sec
    start_date = @basis_date - 1.year - 1.month
    end_date = @basis_date - 1.year + 1.month
    @n_days = (end_date - start_date).ceil / 86400

    arrivals = @station.arrivals.arrived_between(start_date, end_date)
    departures = @station.departures.departed_between(start_date, end_date)

    @arrival_hash = count_trips(current_seconds, arrivals, :arrived_at)
    @departure_hash = count_trips(current_seconds, departures, :departed_at)
  end

  private
  def count_trips(current_seconds, trips, time_attr)
    ret = Hash.new(0)
    trips.each do |trip|
      trip_time = trip.send(time_attr)
      trip_seconds = trip_time.hour * 3600 + trip_time.min * 60 + trip_time.sec
      delta = trip_seconds - current_seconds
      next unless delta >= 0

      # Round down to previous multiple of 10.
      # So ret[0] is count of all times in the next 0-9 minutes
      # and ret[10] is count of all times in next 10-19 minutes, etc.
      key = (delta.to_f / 600).ceil * 10
      ret[key] += 1
    end

    ret
  end
end
