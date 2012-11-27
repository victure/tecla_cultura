class ChangingOthersEventsFields < ActiveRecord::Migration
  def up
  	change_table :events do |t|
  		t.remove :place_at
  		t.change :address, :text
  		t.change :description, :text
  	end
  end

  def down
  	change_table :events do |t|
  		t.string :place_at
  		t.change :address, :string
  		t.change :description, :string
  	end
  end
end
