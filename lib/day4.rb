# frozen_string_literal: false
class Day4
  def sum_valid_sector_ids lines
    lines.reduce(0) do |acc, elem|
      room_name, sector_id, checksum = elem.match(/(.*)-([0-9]+)\[(.*)\]/).captures
      acc + (calculate_checksum(room_name) == checksum ? sector_id.to_i : 0)
    end
  end

  # rubocop:disable AbcSize
  def calculate_checksum str
    str.each_char.with_object(Hash.new(0)) {|c, h| h[c] += 1 unless c == "-" }
       .each_pair.sort {|a, b| a[1] != b[1] ? b[1] <=> a[1] : a[0] <=> b[0] }
       .first(5).reduce([]) {|acc, elem| acc << elem[0] }.join("")
  end
  # rubocop:enable all
end
