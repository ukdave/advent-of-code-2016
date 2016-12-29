# frozen_string_literal: false
require "digest"

class Day5
  def find_interesting_hash str, index = 0
    loop do
      hash = Digest.hexencode(Digest::MD5.digest("#{str}#{index}"))
      return {hash: hash, index: index} if hash.start_with? "00000"
      index += 1
    end
  end

  # rubocop:disable MethodLength
  def find_password door_id
    index = 0
    Array.new(8) {
      result = find_interesting_hash(door_id, index)
      index = result[:index] + 1
      result[:hash][5]
    }.join
  end
  # rubocop:enable all
end
