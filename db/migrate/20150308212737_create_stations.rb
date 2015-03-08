class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :divvy_id, null: false, unique: true
      t.string :name, null: false
      t.float :latitude
      t.float :longitude
      t.integer :capacity
      t.datetime :opened_at
      t.timestamps null: false
    end
  end
end
