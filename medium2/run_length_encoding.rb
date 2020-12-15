class RunLengthEncoding
  def self.encode(input)
    input
      .scan(/((\D)\2*)/)
      .map { |match, char| [match.length == 1 ? nil : match.length, char] }
      .join
  end

  def self.decode(input)
    input
      .split(/(\D)/)
      .each_slice(2)
      .map { |count, char| char * (count.empty? ? 1 : count).to_i }
      .join
  end
end
