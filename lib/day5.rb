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

  # rubocop:disable AbcSize, CyclomaticComplexity, MethodLength, PerlBackrefs
  def find_password2 door_id
    password = Array.new(8) { nil }
    index = 0
    while password.any?(&:nil?)
      result = find_interesting_hash door_id, index
      pos = (result[:hash][5].match(/(\d)/) && $1.to_i) || nil
      password[pos] = result[:hash][6] if !pos.nil? && pos < password.length && password[pos].nil?
      index = result[:index] + 1
    end
    password.join
  end
  # rubocop:enable all
end
