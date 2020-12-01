class Oystercard
attr_reader :balance, :state
LIMIT = 90
FARELIMIT = 1

  def initialize
    @balance = 0
    @state = false
    @fare_limit = FARELIMIT
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if @balance + amount > LIMIT

    @balance += amount
  end

  def touch_in
    raise "Not enough funds" if @balance < @fare_limit

    @state = true
  end

  def in_journey?
    @state
  end

  def touch_out
    deduct(@fare_limit)
    @state = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
