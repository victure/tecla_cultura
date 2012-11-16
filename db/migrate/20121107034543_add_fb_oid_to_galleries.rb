class AddFbOidToGalleries < ActiveRecord::Migration
  def change
  	change_table :galleries do |t|
  		t.string :fb_oid
   		t.change :fb_album, :text
  		t.rename :fb_album, :description
  	end
  end
end
