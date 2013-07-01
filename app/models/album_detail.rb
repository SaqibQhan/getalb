class AlbumDetail < ActiveRecord::Base

  belongs_to :album
  belongs_to :template
  belongs_to :shape

  has_attached_file :photo, :styles => {:small => "150x150>"},
                    :url => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
end
