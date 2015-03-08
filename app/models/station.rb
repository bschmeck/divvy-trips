class Station < ActiveRecord::Base
  has_many :arrivals, class_name: "Trip", foreign_key: :arrival_station_id
  has_many :departures, class_name: "Trip", foreign_key: :departure_station_id
end
