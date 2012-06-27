class Location < ActiveRecord::Base
  attr_accessible :name
  has_many :inventories
  has_many :locations, :through => :inventories
end
