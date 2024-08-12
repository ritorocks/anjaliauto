class TripsController < ApplicationController
  def index
    matching_trips = Trip.all

    @list_of_trips = matching_trips.order({ :created_at => :desc })

    render({ :template => "trips/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id })

    @the_trip = matching_trips.at(0)

    render({ :template => "trips/show" })
  end

  def create
    require 'date'

    the_trip = Trip.new
    
    start_date = params.fetch("query_start_date")
    end_date = params.fetch("query_end_date")
    
    the_trip.turo_reservation_number = params.fetch("query_turo_reservation_number")
    the_trip.start_date = start_date
    the_trip.start_time = params.fetch("query_start_time")
    the_trip.end_date = end_date
    the_trip.end_time = params.fetch("query_end_time")
    the_trip.vehicle_id = params.fetch("query_vehicle_id")
    the_trip.guest_id = params.fetch("query_guest_id")
    the_trip.total_distance_included = params.fetch("query_total_distance_included")
    the_trip.estimated_earnings = params.fetch("query_estimated_earnings")
    
  # Calculate Start Day Automatically from user input  
    # Parse the date string into a Date object
    s_date = Date.strptime(start_date)
    # Get the day of the week
    start_day = s_date.strftime('%A').to_s
    
    the_trip.start_day = start_day
    
  # Calculate End Day Automatically from user input    
    # Parse the date string into a Date object
    e_date = Date.strptime(end_date)
    # Get the day of the week
    end_day = s_date.strftime('%A').to_s
    the_trip.end_day = end_day
    
    the_trip.extras = params.fetch("query_extras")
    the_trip.location_id = params.fetch("query_location_id")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips", { :notice => "Trip created successfully." })
    else
      redirect_to("/trips", { :alert => the_trip.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.turo_reservation_number = params.fetch("query_turo_reservation_number")
    the_trip.start_date = params.fetch("query_start_date")
    the_trip.start_time = params.fetch("query_start_time")
    the_trip.end_date = params.fetch("query_end_date")
    the_trip.end_time = params.fetch("query_end_time")
    the_trip.vehicle_id = params.fetch("query_vehicle_id")
    the_trip.guest_id = params.fetch("query_guest_id")
    the_trip.total_distance_included = params.fetch("query_total_distance_included")
    the_trip.estimated_earnings = params.fetch("query_estimated_earnings")
    the_trip.start_day = params.fetch("query_start_day")
    the_trip.end_day = params.fetch("query_end_day")
    the_trip.extras = params.fetch("query_extras")
    the_trip.location_id = params.fetch("query_location_id")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips/#{the_trip.id}", { :notice => "Trip updated successfully."} )
    else
      redirect_to("/trips/#{the_trip.id}", { :alert => the_trip.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip deleted successfully."} )
  end
end
