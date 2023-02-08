class PhotosController < ApplicationController
  def index
    all_photos = Photo.all
    @list_of_photos = all_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_photo_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => url_photo_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb" })
  end
end
