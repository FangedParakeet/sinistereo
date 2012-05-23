class AddDateToShow < ActiveRecord::Migration
  def change
    add_column :shows, :date, :datetime
  end
end
