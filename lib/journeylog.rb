class JourneyLog

  attr_reader :journey_log, :journey_class

  def initialize(journey_class)
    @journey_log
    @journey_class
  end

  def start(entry_station)
  	@journey_class = entry_station
  end

  def finish

  end

  #private

  def current_journey

  end

end
