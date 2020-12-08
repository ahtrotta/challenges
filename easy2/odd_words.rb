# input
#   - character set of letters, space(s), periods
#     - words are at most 20 letters
#   - include terminating point
#
# output
#   - successive words are separted by a space, last word terminated with period
#   - odd words (odd index) are reversed, even words remain the same
#
# algorithm
#   - check for valid input
#     - reject if any character is not a letter, space, or period
#     - reject if any word is longer than 20 characters
#   - split string using split method
#   - map split string (with index), reverse odd index words
#   - join mapped string with a single space
#
#def odd_words(str)
#  return 'invalid input.' if invalid_input?(str)
#  result = str.split.map.with_index do |word, index|
#    index.odd? ? word.reverse : word
#  end
#  result.join(' ')
#end
#
# algorithm
#   - iterate through string one character at a time
#     - if even is true
#       - advance through word, adding each character to result
#     - if even is false
#       - advance until index points to a space, then go back one
#       - save jump value index here
#       - iterate backwards until hitting a space then jump to jump value
#
#def odd_words(str)
#  return 'invalid input.' if invalid_input?(str)
#
#  idx = 0
#  even = true
#  fin = false
#  result = ''
#
#  loop do
#    if even
#      loop do
#        result << str[idx]
#        idx += 1
#
#        if str[idx] == ' '
#          result << ' '
#          idx += 1 until str[idx] != ' '
#          break
#        elsif str[idx] == '.'
#          result << '.'
#          fin = true
#          break
#        end
#      end
#
#      even = false
#    else
#      idx += 1 until str[idx] == ' ' || str[idx] == '.'
#      jump_idx = idx
#      idx -= 1
#
#      loop do
#        result << str[idx]
#        idx -= 1
#
#        if str[idx] == ' '
#          result << ' '
#          idx = jump_idx
#          idx += 1 until str[idx] != ' '
#
#          if str[idx] == '.'
#            result << '.'
#            fin = true
#          end
#
#          break
#        end
#      end
#
#      even = true
#    end
#    
#    break if fin
#  end
#
#  result
##end
#
#def invalid_input?(str)
#  str.match?(/[^a-z. ]/i) || str.match?(/[a-z]{20,}/i)
#end
#
#p odd_words('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
#p odd_words('&') == 'invalid input.'
#p odd_words('thiswordistoolongsoitshouldbeinvalidithink') == 'invalid input.'
#p odd_words('this  has    more than one   space sometimes.') == 'this sah more naht one ecaps sometimes.'

class OddWords
  def initialize(char_set)
    @char_set = char_set
  end

  def reverse_odd_words
    return '' if @char_set.empty?
    return 'invalid input.' if @char_set.match?(/[^a-z. ]/i)

    @idx = 0
    @idx += 1 until @char_set[@idx] != ' '
    return '.' if @char_set[@idx] == '.'
    @result = ''
    @even = true

    loop do
      @even ? process_even_word : process_odd_word
      advance_to_next_word
      break if @char_set[@idx] == '.'
    end

    @result.dup
  end

  private

  def process_even_word
    char_count = 0

    loop do
      @result << @char_set[@idx]
      @idx += 1
      char_count += 1
      break if @char_set[@idx] =~ /[ .]/ 

      if char_count == 20
        @idx += 1 until @char_set[@idx] =~ /[ .]/ 
        break
      end
    end

    @even = false
    nil
  end

  def process_odd_word
    @idx += 1 until @char_set[@idx] =~ /[ .]/
    jump_idx = @idx
    @idx -= 1
    char_count = 0

    loop do
      @result << @char_set[@idx]
      @idx -= 1
      char_count += 1

      if @char_set[@idx] =~ /[ .]/ || char_count == 20
        @idx = jump_idx
        break
      end
    end

    @even = true
    nil
  end

  def advance_to_next_word
    @idx += 1 until @char_set[@idx] != ' '

    if @char_set[@idx] == '.'
      @result << '.'
    else
      @result << ' '
    end
  end
end

p OddWords.new('whats the matter with kansas.').reverse_odd_words == 'whats eht matter htiw kansas.'
p OddWords.new('whats  the   matter     with    kansas.').reverse_odd_words == 'whats eht matter htiw kansas.'
odd_words = OddWords.new('whats the matter with kansas.')
p odd_words.reverse_odd_words == 'whats eht matter htiw kansas.'
p odd_words.reverse_odd_words == 'whats eht matter htiw kansas.'
p OddWords.new('Some of The LETTERS are CaPiTal.').reverse_odd_words == 'Some fo The SRETTEL are laTiPaC.'
p OddWords.new('ABCDEFGHIJKLMNOPQRSTUVWXYZ.').reverse_odd_words == 'ABCDEFGHIJKLMNOPQRST.'
p OddWords.new('This is a ABCDEFGHIJKLMNOPQRSTUVWXYZ long word.').reverse_odd_words == 'This si a ZYXWVUTSRQPONMLKJIHG long drow.'
p OddWords.new('This is ABCDEFGHIJKLMNOPQRSTUVWXYZ long word.').reverse_odd_words == 'This si ABCDEFGHIJKLMNOPQRST gnol word.'
p OddWords.new('').reverse_odd_words == ''
p OddWords.new('.').reverse_odd_words == '.'
p OddWords.new('  .').reverse_odd_words == '.'
p OddWords.new('This is a test string    .').reverse_odd_words == 'This si a tset string.'
p OddWords.new('This is a test string.    ').reverse_odd_words == 'This si a tset string.'
