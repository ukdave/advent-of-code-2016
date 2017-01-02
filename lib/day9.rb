# frozen_string_literal: false
class Day9
  # rubocop:disable AbcSize, MethodLength
  def decompress str
    out = []
    offset = 0
    until offset >= str.length
      substr = str[offset, str.length]
      match_data = substr.match(/\((\d+)x(\d+)\)/)
      if match_data.nil?
        out << substr
        offset = str.length
      else
        out << substr[0, match_data.begin(0)]
        offset += match_data.begin(0) + match_data[0].length
        seg_len = match_data[1].to_i
        seg_cnt = match_data[2].to_i
        out << str[offset, seg_len] * seg_cnt
        offset += seg_len
      end
    end
    out.join
  end
  # rubocop:enable all
end
