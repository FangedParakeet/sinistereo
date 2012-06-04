class AddStateAndSiteToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :state, :string
    add_column :artists, :website, :string
  end
end
