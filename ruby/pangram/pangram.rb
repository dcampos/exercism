module Pangram
  def self.pangram?(phrase)
    phrase.downcase!
    'a'.upto('z') { |l| return false unless phrase.include?(l) }
  end
end

module BookKeeping
  VERSION = 6
end
