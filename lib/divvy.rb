require 'open-uri'

module Divvy
  class API
    def self.live_status(station_id)
      station_status = parsed_feed.detect{|s| s["id"] == station_id}
      Status.from_feed(station_status)
    end

    private
    def self.raw_feed
      open("http://www.divvybikes.com/stations/json").read
    end

    def self.parsed_feed
      JSON.parse(raw_feed)["stationBeanList"]
    end
  end

  class Status
    attr_accessor :available_bikes, :available_docks, :id, :station_name, :status_value, :total_docks

    def self.from_feed(hash)
      ret = self.new
      ret.id = hash["id"]
      ret.station_name = hash["stationName"]
      ret.available_docks = hash["availableDocks"]
      ret.total_docks = hash["totalDocks"]
      ret.status_value = hash["statusValue"]
      ret.available_bikes = hash["availableBikes"]

      ret
    end
  end
end
