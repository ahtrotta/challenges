class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine', 'UUA' => 'Leucine', 'UUG' => 'Leucine',
    'UCU' => 'Serine','UCC' => 'Serine', 'UCA' => 'Serine',
    'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'
  }

  def self.of_codon(string)
    raise InvalidCodonError if invalid_codon?(string)
    CODONS[string]
  end

  def self.of_rna(string)
    amino_acids = string.scan(/.{3}/).map { |codon| of_codon(codon) }

    if amino_acids.include?('STOP')
      amino_acids[0...(amino_acids.index('STOP'))]
    else
      amino_acids
    end
  end

  def self.invalid_codon?(input)
    input.match?(/[^ACGU]/)
  end
end
