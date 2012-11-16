class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :phone
      t.string :addres
      t.string :web_page
      t.string :twitter_account
      t.boolean :state
      t.text :description
      t.integer :place_type_id

      t.timestamps
    end
  end
end
