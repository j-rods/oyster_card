class Journey

  attr_reader :entry_station, :ended

  def initialize(station)
    @entry_station = station
    @ended = false
  end

end
