class Video < ActiveRecord::Base
  attr_accessible :description, :director, :duration, :title, :year, :trailer_url
  has_many :inventories
  has_many :locations, :through => :inventories
end
