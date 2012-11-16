class AddStartAtToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_at, :time
  end
end
