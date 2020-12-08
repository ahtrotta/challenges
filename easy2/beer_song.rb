class BeerSong
  DEFAULT = Hash.new { |h, k| h[k] = "#{k} bottles" }
  PHRASES = DEFAULT.merge({ 0 => 'No more bottles', 1 => '1 bottle' })

  def verse(num)
    first_verse(num) + second_verse(num - 1)
  end

  def verses(max, min)
    verse_arr = max.downto(min).map { |bottles| verse(bottles) }.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end

  def first_verse(num)
    phrase = PHRASES[num]
    "#{phrase} of beer on the wall, " \
      "#{phrase.downcase} of beer.\n" \
  end

  def second_verse(num)
    if num < 0
      "Go to the store and buy some more, " \
        "99 bottles of beer on the wall.\n"
    elsif num == 0
      "Take it down and pass it around, " \
        "no more bottles of beer on the wall.\n"
    else
      "Take one down and pass it around, " \
        "#{PHRASES[num].downcase} of beer on the wall.\n"
    end
  end
end
