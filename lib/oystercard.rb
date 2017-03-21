class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1


  attr_reader :balance, :fare, :entry_station


  def initialize(fare=MINIMUM_TRAVEL_BALANCE)
    @balance = 0
    @fare = fare
    @entry_station = nil
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(station)
    fail "Insufficient funds. £1 minimum needed to travel." if @balance < MINIMUM_TRAVEL_BALANCE
    @entry_station = station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out
    @entry_station = nil
    deduct(fare)
  end

  private

  attr_writer :deduct, :balance

  def deduct(fare)
    @balance -= fare
  end

end
