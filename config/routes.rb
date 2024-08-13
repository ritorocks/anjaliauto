Rails.application.routes.draw do
  
  root to: redirect("/employees/sign_in")
  # Routes for the Location resource:

  # CREATE
  post("/insert_location", { :controller => "locations", :action => "create" })
          
  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  
  get("/locations/:path_id", { :controller => "locations", :action => "show" })
  
  # UPDATE
  
  post("/modify_location/:path_id", { :controller => "locations", :action => "update" })
  
  # DELETE
  get("/delete_location/:path_id", { :controller => "locations", :action => "destroy" })

  #------------------------------

  devise_for :employees

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })
          
  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  
  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })
  
  # UPDATE
  
  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })
  
  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })

  #------------------------------

  # Routes for the Trip resource:

  # CREATE
  post("/insert_trip", { :controller => "trips", :action => "create" })
          
  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  
  get("/trips/:path_id", { :controller => "trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_trip/:path_id", { :controller => "trips", :action => "update" })
  
  # DELETE
  get("/delete_trip/:path_id", { :controller => "trips", :action => "destroy" })

  #------------------------------

  # Routes for the Guest resource:

  # CREATE
  post("/insert_guest", { :controller => "guests", :action => "create" })
          
  # READ
  get("/guests", { :controller => "guests", :action => "index" })
  
  get("/guests/:path_id", { :controller => "guests", :action => "show" })
  
  # UPDATE
  
  post("/modify_guest/:path_id", { :controller => "guests", :action => "update" })
  
  # DELETE
  get("/delete_guest/:path_id", { :controller => "guests", :action => "destroy" })

  #------------------------------

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
