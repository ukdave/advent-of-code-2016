# frozen_string_literal: false
class Day6
  def decode lines
    freqs = Array.new(lines.first.length) { Hash.new(0) }
    lines.each do |line|
      line.each_char.with_index {|c, i| freqs[i][c] += 1 }
    end
    freqs.reduce([]) {|acc, elem| acc << elem.max_by {|_k, v| v }[0] }.join
  end
end
