class Oystercard

  MAXIMUM_BALANCE = 90


  attr_reader :balance


  def initialize
    @balance = 0
    @in_transit = false
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_transit = true
  end

  def in_journey?
    @in_transit
  end

  def touch_out
    @in_transit = false
  end

end
