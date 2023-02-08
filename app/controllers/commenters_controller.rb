class CommentersController < ApplicationController
  def add
    url_photo_id = params.fetch("query_photo_id")
    url_author_id = params.fetch("query_author_id")
    url_body = params.fetch("query_body")

    #  id         :integer          not null, primary key
    #  body       :text
    #  created_at :datetime         not null
    #  updated_at :datetime         not null
    #  author_id  :integer
    #  photo_id   :integer
    #

    the_comment = Comment.new
    the_comment.body = url_body
    the_comment.author_id = url_author_id
    the_comment.photo_id = url_photo_id

    the_comment.save

    # render({ :template => "comment_templates/insert.html.erb" })
    next_url = "/photos/" + url_photo_id.to_s
    redirect_to(next_url)
  end
end
