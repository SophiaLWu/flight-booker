class PassengerMailer < ApplicationMailer
  default from: 'flights@flightbooker.com'

  def thank_you_email(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: 'Thanks for booking')
  end
end
