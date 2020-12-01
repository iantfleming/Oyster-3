class Oystercard
attr_reader :balance, :state, :start_station
LIMIT = 90
FARELIMIT = 1

  def initialize
    @balance = 0
    @fare_limit = FARELIMIT
    @start_station = nil
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if @balance + amount > LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds" if @balance < @fare_limit

    
    @start_station = station
  end

  def in_journey?
    @start_station
  end

  def touch_out
    deduct(@fare_limit)
    @start_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
