class HomeController < ApplicationController
  before_filter :facebook_auth

  def index
    @album = Album.find_by_id(params[:id]) if !params[:id].blank?
    @album = Album.new if params[:id].blank?
    @templates = Template.all
    @album_details = AlbumDetail.find_all_by_album_id_and_page(@album.id, params[:page]) if !params[:id].blank?
    @template = @album_details.first if !params[:id].blank?
    @shapes = Shape.find_all_by_template_id(@template.template_id) if !params[:id].blank?
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
