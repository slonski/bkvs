class AddVideoTrailerColumn < ActiveRecord::Migration
  def change
    add_column :videos, :trailer_url, :string
  end
end
