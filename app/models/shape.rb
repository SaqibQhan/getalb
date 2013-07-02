class Shape < ActiveRecord::Base
  belongs_to :template
  has_one :album_detail
  self.inheritance_column = nil
  attr_accessible :type, :x, :y, :z, :r, :width, :height, :template_id
end
