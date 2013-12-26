class AddImageIdToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :image_id, :integer
  end
end
