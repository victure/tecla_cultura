class AddMapFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :map_latlng, :string
    add_column :events, :map_zoom, :string
  end
end
