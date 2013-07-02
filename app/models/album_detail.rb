require "open-uri"
class AlbumDetail < ActiveRecord::Base

  belongs_to :album
  belongs_to :template
  belongs_to :shape

  has_attached_file :photo, :styles => {:small => "150x150>", :thumb => "75x75>"}
  #validates_attachment_presence :photo

  def photo_from_url(url, album_detail)
    album_detail_update = album_detail.update_attributes(:photo => URI.parse(url))
  end
end
