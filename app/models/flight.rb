class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name:"Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :flight_time, presence: true
  validates :flight_duration, presence: true

  def self.search_flights(params)
    date = DateTime.strptime(params[:date], "%m/%d/%Y")
    Flight.where(departure_airport_id: params[:departure_airport_id],
                 arrival_airport_id: params[:arrival_airport_id],
                 flight_time: date..date.tomorrow)
  end

  def self.find_dates
    Flight.order(:flight_time)
          .map { |u| u.flight_time.strftime("%m/%d/%Y") }.uniq
  end

end
