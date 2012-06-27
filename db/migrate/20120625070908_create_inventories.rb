class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :location_id
      t.integer :video_id
      t.integer :amount

      t.timestamps
    end
  end
end
