class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @dates = Flight.order(:flight_time)
                   .map { |u| u.flight_time.strftime("%m/%d/%Y") }.uniq
    @airports = Airport.all.map{ |u| [u.code, u.id] }
  end
end
