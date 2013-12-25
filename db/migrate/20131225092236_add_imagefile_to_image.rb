class AddImagefileToImage < ActiveRecord::Migration
  def change
    add_column :images, :imagefile, :string
  end
end
