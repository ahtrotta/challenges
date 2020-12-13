class Crypto
  def initialize(input)
    @input = input
  end

  def normalize_plaintext
    @normalized_plaintext ||= @input.downcase.gsub(/[^a-z\d]/, '')
  end

  def size
    @square_size ||= Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    @plaintext_segs ||= normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext_segments
    @ciphertext_segs ||= (0...size).map do |idx|
      plaintext_segments.map { |segment| segment[idx] }.join
    end
  end

  def ciphertext
    ciphertext_segments.join
  end

  def normalize_ciphertext
    ciphertext_segments.join(' ').strip
  end
end
