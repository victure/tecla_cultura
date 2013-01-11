class AddExtraFieldsToInfoPages < ActiveRecord::Migration
  def change
    add_column :info_pages, :description, :string
    add_column :info_pages, :cover_image, :string
  end
end
