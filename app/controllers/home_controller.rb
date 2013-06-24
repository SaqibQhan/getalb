class HomeController < ApplicationController
  def index
    photos = []
    unless current_user.blank?
      #begin
      @oauth = Koala::Facebook::OAuth.new(FB_APP_ID, FB_SECRET_KEY, FB_CALLBACK_URL)
      @graph = Koala::Facebook::API.new(@oauth.get_app_access_token)
      albums = @graph.get_connections("me", "albums", :fields => "name, photos.fields(source)")
      unless albums.blank?
        albums.each do |albuminfo|
          albuminfo["photos"]["data"].each do |data|
            photos << data["source"]
          end
        end
      end
      #rescue
      #  flash[:error] = "Something Went Wrong"
      #end
    end
  end
end
