class Clock
  def initialize(hours, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def to_s
    sprintf('%02i:%02i', @hours, @minutes)
  end

  def +(number)
    modify_time(number, :+)
  end

  def -(number)
    modify_time(number, :-)
  end

  def modify_time(number, symbol)
    hours, minutes = (@minutes.send(symbol, number)).divmod(60)
    @hours = (@hours + hours) % 24
    @minutes = minutes
    self
  end

  def ==(other)
    to_s == other.to_s
  end
end
