class GuestsController < ApplicationController
  def index
    matching_guests = Guest.all

    @list_of_guests = matching_guests.order({ :created_at => :desc })

    render({ :template => "guests/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_guests = Guest.where({ :id => the_id })

    @the_guest = matching_guests.at(0)

    render({ :template => "guests/show" })
  end

  def create
    the_guest = Guest.new
    the_guest.name = params.fetch("query_name")
    the_guest.turo_profile = params.fetch("query_turo_profile")
    the_guest.phone = params.fetch("query_phone")
    the_guest.trips_count = params.fetch("query_trips_count")

    if the_guest.valid?
      the_guest.save
      redirect_to("/guests", { :notice => "Guest created successfully." })
    else
      redirect_to("/guests", { :alert => the_guest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_guest = Guest.where({ :id => the_id }).at(0)

    the_guest.name = params.fetch("query_name")
    the_guest.turo_profile = params.fetch("query_turo_profile")
    the_guest.phone = params.fetch("query_phone")
    the_guest.trips_count = params.fetch("query_trips_count")

    if the_guest.valid?
      the_guest.save
      redirect_to("/guests/#{the_guest.id}", { :notice => "Guest updated successfully."} )
    else
      redirect_to("/guests/#{the_guest.id}", { :alert => the_guest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_guest = Guest.where({ :id => the_id }).at(0)

    the_guest.destroy

    redirect_to("/guests", { :notice => "Guest deleted successfully."} )
  end
end
