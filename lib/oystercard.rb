class Oystercard
attr_reader :balance, :start_station, :journeys, :exit_station
LIMIT = 90
FARELIMIT = 1
DEFAULT_BALANCE = 0

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @fare_limit = FARELIMIT
    @start_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if @balance + amount > LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds" if @balance < @fare_limit

    #@journeys.push([station]) #new
    @start_station = station
    station
  end

  def in_journey?
    @start_station.nil? ? false : true
    #@journeys.length > 0 ? @journeys[-1].length == 1 : false #new
  end

  def touch_out(station)
    deduct(FARELIMIT)
    @in_journey = false
    @exit_station = station
    last_journey
    #@journeys[-1].push(station) #new
    @start_station = nil
    @exit_station = nil
    #@journeys[-1].to_h #new
  end



  private

  def deduct(amount)
    @balance -= amount
  end

  def last_journey
    @journeys << { :start_station => @start_station, :exit_station => @exit_station }
  end

end
