class Trip < ActiveRecord::Base
  belongs_to :arrival_station, class_name: Station
  belongs_to :departure_station, class_name: Station
end
