class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :city
      t.string :country
      t.string :venue

      t.timestamps
    end
  end
end
