class HomeController < ApplicationController
  before_filter :fb_sign_in
  before_filter :facebook_auth

  def index
    $user_albums = current_user.albums unless current_user.blank?
    @album = Album.find_by_id(params[:id]) if !params[:id].blank?
    @album = Album.new if params[:id].blank?
    @templates = Template.all
    @album_details = AlbumDetail.where('album_id = ? and page = ? and shape_id != ?', @album.id, params[:page], Shape.find_by_type('svg').id) if !params[:id].blank?
    @template = @album_details.first if !params[:id].blank? and !@album_details.blank?
    @shapes = Shape.where('template_id = ? and title != ? ', @template.template_id, 'svg') if !params[:id].blank? and !@template.blank?
    @svg_background = AlbumDetail.find_by_album_id_and_page_and_shape_id(@album.id, params[:page], Shape.find_by_type('svg').id) if !params[:id].blank? and !@album_details.blank?

    $photos = []
    unless current_user.blank?
      begin
        albums = @graph.get_connections("me", "albums", :fields => "name, photos.fields(source)")
        unless albums.blank?
          albums.each do |albuminfo|
            unless albuminfo["photos"].blank?
              unless albuminfo["photos"]["data"].blank?
                albuminfo["photos"]["data"].each do |data|
                  $photos << data["source"]
                end
              end
            end
          end
        end
      rescue
        flash[:error] = "Something Went Wrong"
      end
    end
  end

  def facebook_auth
    @oauth = Koala::Facebook::OAuth.new(FB_APP_ID, FB_SECRET_KEY, FB_CALLBACK_URL)
    @graph = Koala::Facebook::GraphAPI.new(current_user.oauth_token) if current_user
  end

end
