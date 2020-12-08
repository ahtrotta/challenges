class BeerSong
  FIRST_LINE_DEFAULT = Hash.new do |h, k|
    h[k] = "#{k} bottles of beer on the wall, " \
           "#{k} bottles of beer.\n" \
  end

  FIRST_LINES = FIRST_LINE_DEFAULT.merge({ 
    0 => "No more bottles of beer on the wall, " \
         "no more bottles of beer.\n",
    1 => "1 bottle of beer on the wall, " \
         "1 bottle of beer.\n"
  })

  SECOND_LINE_DEFAULT = Hash.new do |h, k|
    h[k] = "Take one down and pass it around, " \
           "#{k} bottles of beer on the wall.\n"
  end

  SECOND_LINES = SECOND_LINE_DEFAULT.merge({
    -1 => "Go to the store and buy some more, " \
          "99 bottles of beer on the wall.\n",
    0 => "Take it down and pass it around, " \
         "no more bottles of beer on the wall.\n",
    1 => "Take one down and pass it around, " \
         "1 bottle of beer on the wall.\n"
  })

  def verse(num)
    FIRST_LINES[num] + SECOND_LINES[num - 1]
  end

  def verses(max, min)
    verse_arr = max.downto(min).map { |bottles| verse(bottles) }.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end
