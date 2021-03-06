# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "CREATING DEFAULT TEMPLATES"

for i in 1..1
  template = Template.create(:title => "Template1", :width => 200, :height => 100)
  shape = Shape.create(:type => "svg")
  shape = Shape.create(:type => "circle", :x => 730, :y => 70, :image_x => 668, :image_y => 0, :r => 55, :image_width => 160, :image_height => 160, :template_id => template.id)
  shape = Shape.create(:type => "rect", :x => 170, :y => 70, :y => 70, :image_x => 165, :image_y => 70, :z => nil, :r => nil, :width => 450, :height => 370, :image_width => 450, :image_height => 370, :template_id => template.id)
  shape = Shape.create(:type => "circle", :x => 70, :y => 70, :y => 70, :image_x => 0, :image_y => 0, :r => 55, :image_width => 160, :image_height => 160, :template_id => template.id)

end