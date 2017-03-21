class Oystercard

  MAXIMUM_BALANCE = 90


  attr_reader :balance


  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

end
