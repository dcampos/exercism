module BookKeeping
  VERSION = 3
end

class Hamming

  def self.compute(left, right)
    raise ArgumentError, 'Left and right strands must be the same length' unless left.size == right.size
    left.chars.zip(right.chars).count { |x, y| x != y }
  end

end

