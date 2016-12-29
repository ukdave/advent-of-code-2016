# frozen_string_literal: false
class Day6
  def decode lines
    calculate_frequencies(lines).reduce([]) {|acc, elem|
      acc << elem.max_by {|_k, v| v }[0]
    }.join
  end

  def decode2 lines
    calculate_frequencies(lines).reduce([]) {|acc, elem|
      acc << elem.min_by {|_k, v| v }[0]
    }.join
  end

  private

  def calculate_frequencies lines
    freqs = Array.new(lines.first.length) { Hash.new(0) }
    lines.each do |line|
      line.each_char.with_index {|c, i| freqs[i][c] += 1 }
    end
    freqs
  end
end
