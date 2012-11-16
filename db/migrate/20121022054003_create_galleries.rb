class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :fb_album
      t.integer :event_id

      t.timestamps
    end
  end
end
