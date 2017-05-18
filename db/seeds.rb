
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

all_flight_possibilities = (1..9).to_a.product((1..9).to_a)
                                      .reject { |pair| pair[0] == pair[1] }
all_flight_possibilities.each do |airports|
  d = 0
  num_flights = rand(2..4)
  until d == 15
    num_flights.times do
      Flight.create(departure_airport_id: airports[0],
                arrival_airport_id: airports[1],
                flight_time: Faker::Time.between(d.days.from_now, (d+1).days.from_now),
                flight_duration: "#{rand(0..18)} hrs #{rand(0..59)} mins")
    end
    d += 1
  end
end

