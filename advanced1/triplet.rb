class Triplet
  attr_reader :sum, :product

  def initialize(n1, n2, n3)
    @n1, @n2, @n3 = n1, n2, n3
    @sum = n1 + n2 + n3
    @product = n1 * n2 * n3
  end

  def pythagorean?
    @n1**2 + @n2**2 == @n3**2
  end

  def self.where(min_factor: 1, max_factor: 1, sum: nil)
    combos = (min_factor..max_factor).to_a.combination(3)
    triplets = combos.select do |n1, n2, n3|
      if sum
        (n1 + n2 + n3 == sum) && (n1**2 + n2**2 == n3**2)
      else
        n1**2 + n2**2 == n3**2
      end
    end
    triplets.map { |triplet| new(*triplet) }
  end
end
