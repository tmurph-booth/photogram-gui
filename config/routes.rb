Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/insert_user_record", { :controller => "users", :action => "insert" })
  get("/update_user/:modify_id", { :controller => "users", :action => "update" })
  
  get("/insert_comment_record", { :controller => "commenters", :action => "add" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
  get("/insert_photo", { :controller => "photos", :action => "insert" })
end
