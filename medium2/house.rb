class House
  def self.recite
    instance = House.new
    rhyme = (0..11).map { |index| instance.send(:get_verse, index) }
    rhyme.reverse.join("\n\n") + "\n"
  end

  private

  def get_verse(index)
    verse = (index...11).each_with_object(['']) do |line_number, lines|
      end_of_last_line, beginning_of_line = pieces[line_number]
      lines.last << end_of_last_line
      lines << beginning_of_line + ' '
    end

    verse.last << pieces.last.last + '.'
    verse.first.prepend('This is ')
    verse.join("\n")
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
