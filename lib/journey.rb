class Journey
  attr_accessor :journey_fare, :start_station, :exit_station, :journeys
  MAX_FARE = 6
  # FARE = 2
  STANDARD_FARE = 1

  def initialize
    @journey_fare = 0
    @journeys = []
    @start_station = nil
    @exit_station = nil
  end
  # def start(station)
  #   raise "Not enough funds" if @balance < @fare_limit
  #
  #   #@journeys.push([station]) #new
  #   @start_station = station
  #   station
  # end

  def complete_journey?
    !@journeys[-1].has_value?(nil)

  end

  def fare_total
    complete_journey? ? @journey_fare = STANDARD_FARE : @journey_fare = MAX_FARE
  end

  def in_journey?
    @start_station.nil? ? false : true
  end

  def last_journey
    journey = { :start_station => @start_station, :exit_station => @exit_station }
    @journeys << journey
  end

end
