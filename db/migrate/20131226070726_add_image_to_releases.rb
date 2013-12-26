class AddImageToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :image, :integer
  end
end
