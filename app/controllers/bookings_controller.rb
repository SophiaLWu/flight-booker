class BookingsController < ApplicationController

  def new
    @flight = Flight.find_by(id: params[:flight_id])
    @booking = @flight.bookings.build
    @passenger_count = params[:passengers].to_i

    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create!(booking_params)
    if @booking.save
      flash[:success] = "Your flight has been booked!"
      PassengerMailer.thank_you_email(@booking.passengers.first).deliver_now!
      redirect_to @booking
    else
      flash.now[:danger] = "There was an error. Please try again."
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params 
      params.require(:booking).permit(:flight_id,
                                      :passengers_attributes => [:name, :email])
    end
end
