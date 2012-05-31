class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.text :bio
      t.string :city
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
