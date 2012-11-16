class RenameAddresFromPlaces < ActiveRecord::Migration
  def up
  	rename_column :places, :addres, :address
  end

  def down
  	rename_column :places, :address, :addres
  end
end
