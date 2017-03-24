class JourneyLog

  attr_reader :journey_log, :journey_class, :entry_station

  def initialize(journey_class)
    @journey_log
    @journey_class
    @entry_station = nil
  end

  def start(entry_station)
  	@entry_station = entry_station
  end

  def finish

  end

  #private

  def current_journey
    if !!entry_station
      journey_class = Journey.new(entry_station) 
      journey_class.entry_station
    else
      "Incomplete journey"
    end
  end

end
