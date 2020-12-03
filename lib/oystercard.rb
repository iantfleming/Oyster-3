require_relative 'journey'

class Oystercard
attr_reader :balance, :journey
LIMIT = 90
# STANDARD_FARE = 1
DEFAULT_BALANCE = 0

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    # @fare_limit = STANDARD_FARE
    # @start_station = nil
    # @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if @balance + amount > LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds" if @balance < Journey::STANDARD_FARE
    @journey = Journey.new

    @journey.start_station = station
    # station
  end

  # def in_journey?
  #   @start_station.nil? ? false : true
  # end

  def touch_out(station)
    # @journey.in_journey? = false
    @journey.exit_station = station
    @journey.last_journey
    @journey.complete_journey?
    deduct(@journey.fare_total)
    @journey.start_station = nil
    @journey.exit_station = nil
  end

  # def complete_journey?
  #   @journeys[-1].has_value?(nil)
  # end


  # private
  #
  # def last_journey
  #   journey = { :start_station => @start_station, :exit_station => @exit_station }
  #   @journeys << journey
  # end
  private

  def deduct(amount)
    @balance -= amount
  end
end
