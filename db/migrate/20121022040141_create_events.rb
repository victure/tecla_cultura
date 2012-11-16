class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_at
      t.float :cover
      t.integer :place_id
      t.string :pace_at
      t.string :flayer
      t.integer :state
      t.string :description

      t.timestamps
    end
  end
end
