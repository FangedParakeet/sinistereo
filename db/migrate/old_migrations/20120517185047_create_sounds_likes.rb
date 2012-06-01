class CreateSoundsLikes < ActiveRecord::Migration
  def change
    create_table :sounds_likes do |t|
      t.string :name

      t.timestamps
    end
  end
end
