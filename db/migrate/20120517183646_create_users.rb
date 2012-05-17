class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :is_artist?
      t.string :artist_name
      t.text :bio
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
