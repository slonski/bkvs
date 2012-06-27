class CreateVideoLocationJoinTable < ActiveRecord::Migration
  def change
    create_table :videos_locations, :id => false do |t|
      t.integer :video_id
      t.integer :location_id
    end
  end
end
