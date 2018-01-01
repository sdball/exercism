module BookKeeping
  VERSION = 3
end

module Hamming
  def self.compute(string_a, string_b)
    raise ArgumentError.new("Strings must be equal length") if string_a.size != string_b.size

    arr_a = string_a.split('')
    arr_b = string_b.split('')

    arr_a.zip(arr_b).count { |a,b| a != b }
  end
end
