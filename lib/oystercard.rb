class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1


  attr_reader :balance, :fare, :entry_station, :exit_station, :in_use, :journey_history


  def initialize(fare=MINIMUM_TRAVEL_BALANCE)
    @balance = 0
    @fare = fare
    @entry_station = nil
    @exit_station = nil
    @in_use = false
    @journey_history = []
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds. £1 minimum needed to travel." if @balance < MINIMUM_TRAVEL_BALANCE
    self.in_use = true
    @entry_station = station
  end

  def in_journey?
    self.in_use
  end

  def touch_out(station)
    deduct(fare)
    self.in_use = false
    self.exit_station = station
    self.add_to_journey_history
  end

  def add_to_journey_history
    self.journey_history << {entry_station: self.entry_station, exit_station: self.exit_station}
  end

  private

  attr_writer :deduct, :balance, :exit_station, :in_use

  def deduct(fare)
    @balance -= fare
  end

end
