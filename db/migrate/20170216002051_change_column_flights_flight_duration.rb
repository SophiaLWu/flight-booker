class ChangeColumnFlightsFlightDuration < ActiveRecord::Migration[5.0]
  def change
    change_column :flights, :flight_duration, :string
  end
end
