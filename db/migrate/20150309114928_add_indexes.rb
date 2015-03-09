class AddIndexes < ActiveRecord::Migration
  def change
    add_index :stations, :divvy_id
    add_index :trips, :departure_station_id
    add_index :trips, :arrival_station_id
  end
end
