class AlbumesController < ApplicationController
  #before_filter :authenticate_user!, :only => [:create_album]

  def new

  end

  def rendering_template
    @template = Template.find_by_id(params[:template_id])
    @shapes = Shape.find_all_by_template_id(@template.id)
    render "home/_template", :layout => false
  end

  def create_album
    shapes_count = params[:shapes_count].to_i
    album = Album.new(:user_id => current_user.id)
    if album.save
      for i in 1..shapes_count
        image_type = params["image_type#{i}"]
        album_page = AlbumDetail.new(:album_id => album.id, :template_id => params[:template_id], :page => params[:page], :rotate => params["image#{i}"], :shape_id => params["shape_id#{i}"])
        album_page_photo = album_page.update_attributes(:photo => params["file_opener#{i}"]) if image_type == "upload" and !params["file_opener#{i}"].blank?
        album_page_photo = AlbumDetail.new.photo_from_url(params["fb_url#{i}"], album_page) if image_type == "fb" and !params["fb_url#{i}"].blank?
        album_pages = album_page.update_attributes(:image_type => image_type) if !params["fb_url#{i}"].blank? or !params["file_opener#{i}"].blank?
      end
      redirect_to "/?id=#{album.id}&page=#{ params[:page].to_i + 1}"
    end
  end

end
