class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username })

    @the_username = matching_usernames.at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def insert
    url_username = params.fetch("query_username")

    a_new_user = User.new
    a_new_user.username = url_username

    a_new_user.save

    # render({ :template => "user_templates/insert.html.erb" })
    next_url = "/users/" + a_new_user.username.to_s
    redirect_to(next_url)
  end

  def update
    url_username = params.fetch("query_username")
    updated_id = params.fetch("modify_id")

    the_user = User.where({ :id => updated_id }).at(0)

    the_user.username = url_username

    the_user.save
    
    # render({ :template => "user_templates/update.html.erb"})
    next_url = "/users/" + the_user.username.to_s
    redirect_to(next_url)
  end
end
