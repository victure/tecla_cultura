class ChangeEventDateAtColumnType < ActiveRecord::Migration
  def up
  	#change_column(:events, :start_at, :date)
  end

  def down
  	#change_column(:events, :start_at, :datetime)
  end
end
