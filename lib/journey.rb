class Journey

  attr_reader :entry_station, :ended

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(station)
    @entry_station = station
    @fare = nil
    @ended = nil
  end

  def start_journey
    self.ended = false
  end

  def end_journey(station)
    self.ended = true
    self
  end

  def fare
    if ended == true
      self.fare = MINIMUM_FARE
    elsif ended == false
      self.fare = PENALTY_FARE
    else fare = 0
    end
  end

  def complete?
    ended
  end

  private

  attr_writer :ended, :fare

end
