class CreateInfoPages < ActiveRecord::Migration
  def change
    create_table :info_pages do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
