class AddReleaseRefToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :release, index: true
  end
end
