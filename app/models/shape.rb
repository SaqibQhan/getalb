class Shape < ActiveRecord::Base
  belongs_to :template
  has_one :album_detail
  self.inheritance_column = nil
  attr_accessible :type, :x, :y, :image_x, :image_y, :z, :r, :width, :height, :image_width, :image_height, :template_id
end
