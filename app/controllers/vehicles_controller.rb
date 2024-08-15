class VehiclesController < ApplicationController
  def index
    matching_vehicles = Vehicle.all

    @list_of_vehicles = matching_vehicles.order({ :created_at => :asc })

    render({ :template => "vehicles/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vehicles = Vehicle.where({ :id => the_id })

    @the_vehicle = matching_vehicles.at(0)

    render({ :template => "vehicles/show" })
  end

  def create
    the_vehicle = Vehicle.new

    the_vehicle.id = params.fetch("query_vehicle_id")
    the_vehicle.name = params.fetch("query_make") + " " + params.fetch("query_model") + " " + params.fetch("query_year")
    the_vehicle.license_plate = params.fetch("query_license_plate")
    the_vehicle.image = params.fetch("query_image_url")
    the_vehicle.year = params.fetch("query_year")
    the_vehicle.make = params.fetch("query_make")
    the_vehicle.model = params.fetch("query_model")
    the_vehicle.color = params.fetch("query_color")
    the_vehicle.trips_count = params.fetch("query_trips_count")
    the_vehicle.jobs_count = params.fetch("query_jobs_count")

    if the_vehicle.valid?
      the_vehicle.save
      redirect_to("/vehicles", { :notice => "Vehicle created successfully." })
    else
      redirect_to("/vehicles", { :alert => the_vehicle.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vehicle = Vehicle.where({ :id => the_id }).at(0)

    the_vehicle.id = params.fetch("query_vehicle_id")
    the_vehicle.name = params.fetch("query_make") + " " + params.fetch("query_model") + " " + params.fetch("query_year")
    the_vehicle.image = params.fetch("query_image_url")
    the_vehicle.year = params.fetch("query_year")
    the_vehicle.make = params.fetch("query_make")
    the_vehicle.model = params.fetch("query_model")
    the_vehicle.color = params.fetch("query_color")
    the_vehicle.trips_count = params.fetch("query_trips_count")
    the_vehicle.jobs_count = params.fetch("query_jobs_count")

    if the_vehicle.valid?
      the_vehicle.save
      redirect_to("/vehicles/#{the_vehicle.id}", { :notice => "Vehicle updated successfully." })
    else
      redirect_to("/vehicles/#{the_vehicle.id}", { :alert => the_vehicle.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vehicle = Vehicle.where({ :id => the_id }).at(0)

    the_vehicle.destroy

    redirect_to("/vehicles", { :notice => "Vehicle deleted successfully." })
  end
end
