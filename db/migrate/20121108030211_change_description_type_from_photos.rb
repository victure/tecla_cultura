class ChangeDescriptionTypeFromPhotos < ActiveRecord::Migration
  def up
  	change_column(:photos,:description, :text)
  end

  def down
  	change_column(:photos, :description, :string)
  end
end
