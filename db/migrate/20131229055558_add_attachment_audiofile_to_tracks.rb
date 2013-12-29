class AddAttachmentAudiofileToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :audiofile
    end
  end

  def self.down
    drop_attached_file :tracks, :audiofile
  end
end
