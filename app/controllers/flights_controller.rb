class FlightsController < ApplicationController

  def index
    @dates = Flight.find_dates
    @airports = Airport.all.map{ |u| [u.code, u.id] }

    if params[:commit] == "Search"
      if params[:departure_airport_id] == params[:arrival_airport_id]
        flash.now[:error] = "Departure and arrival airports can't be the same."
      end
    end

    if params[:date]
      @flights = Flight.search_flights(params)
    end
  end

end
