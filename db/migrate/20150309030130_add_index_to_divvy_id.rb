class AddIndexToDivvyId < ActiveRecord::Migration
  def change
    add_index :trips, :divvy_id
  end
end
