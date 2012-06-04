class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :user_type
      t.timestamps
    end
  end
end
