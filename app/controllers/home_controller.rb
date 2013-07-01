class HomeController < ApplicationController
  before_filter :facebook_auth

  def index
    @templates = Template.all
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
