Rails.application.routes.draw do

  # Routes for the Vehicle resource:

  # CREATE
  post("/insert_vehicle", { :controller => "vehicles", :action => "create" })
          
  # READ
  get("/vehicles", { :controller => "vehicles", :action => "index" })
  
  get("/vehicles/:path_id", { :controller => "vehicles", :action => "show" })
  
  # UPDATE
  
  post("/modify_vehicle/:path_id", { :controller => "vehicles", :action => "update" })
  
  # DELETE
  get("/delete_vehicle/:path_id", { :controller => "vehicles", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
