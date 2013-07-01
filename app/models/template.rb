class Template < ActiveRecord::Base

  has_many :albums
  has_many :shapes
  has_many :album_details
end
