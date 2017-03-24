class JourneyLog

  attr_reader :journey_log, :journey_class, :entry_station, :exit_station

  def initialize(journey_class)
    @journey_log = []
    @journey_class
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
  	@entry_station = entry_station
  end

  def finish(exit_station)
    @journey_class.end_journey(exit_station)
    exit_station = exit_station
  end

  private

  def current_journey
    if !!entry_station
      @journey_class = Journey.new(entry_station)
      @journey_class.entry_station
    else
      "Incomplete journey"
    end
  end

  def journeys
    @journey_log << {entry_station: entry_station, exit_station: exit_station}
  end

end
