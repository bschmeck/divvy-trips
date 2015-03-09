class StationsController < ApplicationController
  def show
    Station.find(params[:id])
  end

  def flow
    station = Station.find(params[:id])
  end
end
