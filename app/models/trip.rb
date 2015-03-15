class Trip < ActiveRecord::Base
  belongs_to :arrival_station, class_name: Station
  belongs_to :departure_station, class_name: Station

  scope :arrived_between, ->(start_date, end_date){ where(arrived_at: start_date..end_date) }
  scope :departed_between, ->(start_date, end_date){ where(departed_at: start_date..end_date) }
end
