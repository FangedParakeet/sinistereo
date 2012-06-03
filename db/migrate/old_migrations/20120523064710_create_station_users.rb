class CreateStationUsers < ActiveRecord::Migration
  def change
    create_table :station_users do |t|
      t.integer :station_id
      t.integer :user_id

      t.timestamps
    end
  end
end
