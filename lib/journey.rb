class Journey
  attr_reader :journey_fare
  MAX_FARE = 6
  FARE = 2

  def initialize
    @journey_fare = 0
  end
  # def start(station)
  #   raise "Not enough funds" if @balance < @fare_limit
  #
  #   #@journeys.push([station]) #new
  #   @start_station = station
  #   station
  # end

  def fare_total
    complete? ? @journey_fare = FARE : @journey_fare = MAX_FARE
  end
  #
  def complete?
    false
  end
  #
  # def finish
  #
  # end

end
