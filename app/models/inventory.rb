class Inventory < ActiveRecord::Base
  attr_accessible :amount, :location_id, :video_id
  belongs_to :video
  belongs_to :location
end
