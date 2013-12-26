class AddImageUrlToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :image_url, :string
  end
end
