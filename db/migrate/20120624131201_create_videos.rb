class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :director
      t.integer :duration

      t.timestamps
    end
  end
end
