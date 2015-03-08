class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :divvy_id, null: false, unique: true
      t.integer :departure_station_id, null: false
      t.datetime :departed_at, null: false
      t.integer :arrival_station_id, null: false
      t.datetime :arrived_at, null: false
      t.integer :duration_in_seconds, null: false
      t.string :user_type
      t.string :gender
      t.integer :birth_year
      t.timestamps null: false
    end
  end
end
