class AddVotesColToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :votes, :integer, :default => 0
  end
end
