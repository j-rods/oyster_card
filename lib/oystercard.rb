require_relative 'station'
require_relative 'journey'
require_relative 'journeylog'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1

  attr_reader :balance, :journey_history, :journey

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds. £1 minimum needed to travel." if @balance < MINIMUM_TRAVEL_BALANCE
    if defined?(journey.fare)
      deduct(journey.fare)
    else
      @journey = Journey.new(station)
    end
    self.journey.start_journey
  end

  def touch_out(station)
    self.journey.end_journey(station)
    deduct(journey.fare)
    self.add_to_journey_history(station)
  end

  def add_to_journey_history(station)
    self.journey_history << {entry_station: journey.entry_station, exit_station: station}
  end

  private

  attr_writer :deduct, :balance

  def deduct(fare)
    @balance -= fare
  end

end
