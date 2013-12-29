class AddAttachmentImagefileToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :imagefile
    end
  end

  def self.down
    drop_attached_file :images, :imagefile
  end
end
