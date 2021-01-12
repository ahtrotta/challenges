class Game
  def initialize
    @frames = []
    @current_frame = Frame.new
  end

  def roll(pins)
    validate_roll(pins)
    @current_frame.add_roll(pins)

    if @current_frame.full?
      @frames << @current_frame
      @current_frame = (@frames.size == 9 ? Frame.new(:tenth) : Frame.new)
    end
  end

  def score
    if @frames.size < 10
      raise StandardError, 'Score cannot be taken until the end of the game'
    end

    score_strikes_and_spares
    @total ||= @frames.reduce(0) { |acc, elem| acc + elem.score }
  end

  private

  def score_strikes_and_spares
    return if @total

    @frames[0...9].each_with_index do |frame, index|
      if frame.spare?
        frame.score(get_next_rolls(index + 1, 1))
      elsif frame.strike?
        frame.score(get_next_rolls(index + 1, 2))
      end
    end
  end

  def get_next_rolls(frame_index, rolls_needed)
    next_rolls = @frames[frame_index].rolls

    if rolls_needed == 2 && next_rolls.size < 2
      next_rolls = (next_rolls + @frames[frame_index + 1].rolls).flatten
    end

    next_rolls[0, rolls_needed]
  end

  def validate_roll(pins)
    unless pins >= 0 && pins <= 10
      raise StandardError, 'Pins must have a value from 0 to 10'
    end

    if @frames.size == 10
      raise StandardError, 'Should not be able to roll after game is over'
    end

    @current_frame.valid_roll?(pins)
  end
end

class Frame
  attr_reader :rolls, :tenth_frame

  def initialize(tenth_frame = :not_tenth)
    @tenth_frame = (tenth_frame == :tenth)
    @rolls = []
  end

  def add_roll(pins)
    valid_roll?(pins)
    @rolls << pins
  end

  def score(next_rolls = [0])
    @score ||= @rolls.sum + next_rolls.sum
  end

  def spare?
    !strike? && (@rolls[0, 2].sum == 10)
  end

  def strike?
    @rolls.first == 10
  end

  def tenth_frame?
    @tenth_frame
  end

  def full?
    if tenth_frame? && (strike? || spare?)
      rolls.size == 3
    else
      strike? || rolls.size == 2
    end
  end

  def valid_roll?(pins)
    if tenth_frame? && rolls.size == 2 &&
       rolls.last != 10 && rolls.last + pins > 10
      raise StandardError, 'Pin count exceeds pins on the lane'
    elsif !tenth_frame? && rolls.sum + pins > 10
      raise StandardError, 'Pin count exceeds pins on the lane'
    end
  end
end
