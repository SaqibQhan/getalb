module AlbumesHelper

  def album_exist(album, album_details)
    if album.new_record? or album_details.blank?
      return true
    else
      return false
    end
  end

end
