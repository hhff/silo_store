class AddStuffToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :artist, :text
    add_column :releases, :release_date, :date
    add_column :releases, :is_private, :boolean
    add_column :releases, :upc_ean, :text
  end
end
