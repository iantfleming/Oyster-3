class Oystercard
attr_reader :balance, :state, :start_station, :journeys
LIMIT = 90
FARELIMIT = 1

  def initialize
    @balance = 0
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
    @start_station
    #@journeys.length > 0 ? @journeys[-1].length == 1 : false #new
  end

  def touch_out(station)
    deduct(@fare_limit)
    #@journeys[-1].push(station) #new
    @journeys.push({@start_station => station})
    @start_station = nil
    #@journeys[-1].to_h #new
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
