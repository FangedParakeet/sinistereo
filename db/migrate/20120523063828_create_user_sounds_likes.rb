class CreateUserSoundsLikes < ActiveRecord::Migration
  def change
    create_table :user_sounds_likes do |t|
      t.integer :user_id
      t.integer :sounds_like_id

      t.timestamps
    end
  end
end
