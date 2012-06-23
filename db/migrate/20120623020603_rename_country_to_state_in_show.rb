class RenameCountryToStateInShow < ActiveRecord::Migration
  def change
    rename_column :shows, :country, :state
  end
end
