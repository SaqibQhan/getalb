class Shape < ActiveRecord::Base
  belongs_to :template
  has_many :album_details
  self.inheritance_column = nil
  attr_accessible :type, :x, :y, :z, :r, :width, :height, :template_id
end
