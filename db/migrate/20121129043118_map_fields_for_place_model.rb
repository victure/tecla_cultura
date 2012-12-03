class MapFieldsForPlaceModel < ActiveRecord::Migration
  def up
  	add_column :places, :map_latlng, :string
  	add_column :places, :map_zoom, :string
  	add_column :places, :fanpage, :string

  end

  def down
  	remove_column :places, :map_latlng
  	remove_column :places, :map_zoom
  	remove_column :places, :fanpage
  end
end
