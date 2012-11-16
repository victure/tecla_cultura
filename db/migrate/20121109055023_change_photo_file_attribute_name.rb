class ChangePhotoFileAttributeName < ActiveRecord::Migration
  def up
  	rename_column :photos, :file, :picture_file
  end

  def down
  	rename_column :photos, :picture_file, :file
  end
end
