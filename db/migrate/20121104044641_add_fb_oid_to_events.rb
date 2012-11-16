class AddFbOidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :fb_oid, :string
  end
end
