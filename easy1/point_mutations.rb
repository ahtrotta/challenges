class DNA
  def initialize(sequence)
    @sequence = sequence
  end
  
  def hamming_distance(other_sequence)
    max_idx = get_max_idx(@sequence, other_sequence)

    (0...max_idx).reduce(0) do |sum, i|
      sum + (@sequence[i] == other_sequence[i] ? 0 : 1)
    end
  end

  private
  
  def get_max_idx(sequence, other_sequence)
    seq_len, oth_seq_len = sequence.length, other_sequence.length
    seq_len > oth_seq_len ? oth_seq_len : seq_len
  end
end
