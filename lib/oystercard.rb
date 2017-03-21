class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1


  attr_reader :balance, :fare


  def initialize(fare=MINIMUM_TRAVEL_BALANCE)
    @balance = 0
    @in_transit = false
    @fare = fare
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail "Insufficient funds. £1 minimum needed to travel." if @balance < MINIMUM_TRAVEL_BALANCE
    @in_transit = true
  end

  def in_journey?
    @in_transit
  end

  def touch_out
    @in_transit = false
    deduct(fare)
  end

  private

  attr_writer :deduct, :balance

  def deduct(fare)
    @balance -= fare
  end

end
