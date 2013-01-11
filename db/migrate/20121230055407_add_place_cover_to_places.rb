class AddPlaceCoverToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :cover_image, :string
  end
end
