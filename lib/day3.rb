# frozen_string_literal: false
class Day3
  def self.valid_triangle? sides
    s = sides.sort
    s[0] + s[1] > s[2]
  end
end
