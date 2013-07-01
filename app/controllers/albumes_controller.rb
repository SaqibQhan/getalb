class AlbumesController < ApplicationController

  def rendering_template
    @template = Template.find_by_id(params[:id])
    @shapes = Shape.find_all_by_template_id(@template.id)
    render "home/_template", :layout => false
  end

  def create_album
    puts "SSSSSSSSSSSSSSSSSSSSSS", params.inspect
    a = AlbumDetail.new(params[:avatar1])
    a.save
    ssssssssssssss

  end

end
