
# Airports
airports = Airport.create([
  {code: "SFO"},  # San Fran
  {code: "ATL"},  # Atlanta
  {code: "PEK"},  # Beijing
  {code: "ORD"},  # Chicago
  {code: "LAX"},  # Los Angeles
  {code: "HKG"},  # Hong Kong
  {code: "DFW"},  # Dallas
  {code: "JFK"},  # NYC
  {code: "LHR"}])  # London


# Flights
20.times do
  departing_airport = rand(0..8)
  arriving_airport = rand(0..8)
  until arriving_airport != departing_airport
    arriving_airport = rand(0..8)
  end
  Flight.create(departure_airport_id: departing_airport,
                arrival_airport_id: arriving_airport,
                flight_time: Faker::Time.forward(100),
                flight_duration: "#{rand(0..18)} hrs #{rand(0..59)} mins")
end

