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

  def delete
    url_photo_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => url_photo_id })

    @the_photo = matching_photos.at(0)

    @the_photo.destroy

    #render({ :template => "photo_templates/delete.html.erb" })

    redirect_to("/photos")
  end

  def insert
    url_image = params.fetch("query_image")
    url_caption = params.fetch("query_caption")
    url_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = url_image
    a_new_photo.owner_id = url_owner_id
    a_new_photo.caption = url_caption

    a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb" })
    next_url = "/photos/" + a_new_photo.id.to_s
    redirect_to(next_url)
  end

  def update
    updated_id = params.fetch("modify_id")
    url_image = params.fetch("query_image")
    url_caption = params.fetch("query_caption")

    matching_photos = Photo.where({ :id => updated_id })

    the_photo = matching_photos.at(0)

    the_photo.image = url_image
    the_photo.caption = url_caption

    the_photo.save

    #render({ :template => "photo_templates/update.html.erb" })
    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
  end
end
