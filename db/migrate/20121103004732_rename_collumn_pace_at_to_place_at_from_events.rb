class RenameCollumnPaceAtToPlaceAtFromEvents < ActiveRecord::Migration
  def up
  	rename_column :events, :pace_at, :place_at
  end

  def down
  	rename_column :events, :place_at, :pace_at
  end
end
