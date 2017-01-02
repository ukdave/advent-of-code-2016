# frozen_string_literal: false
class Day9
  # rubocop:disable AbcSize, MethodLength
  def decompress_v1 str
    out = []
    offset = 0
    while offset < str.length
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

  # rubocop:disable AbcSize, MethodLength
  def decompress_v1_len str
    length = 0
    offset = 0
    while offset < str.length
      substr = str[offset, str.length]
      match_data = substr.match(/\((\d+)x(\d+)\)/)
      if match_data.nil?
        length += str.length - offset
        offset = str.length
      else
        seg_len = match_data[1].to_i
        seg_cnt = match_data[2].to_i
        length += match_data.begin(0) + seg_len * seg_cnt
        offset += match_data.begin(0) + match_data[0].length + seg_len
      end
    end
    length
  end
  # rubocop:enable all

  # rubocop:disable AbcSize, MethodLength
  def decompress_v2_len str
    length = 0
    offset = 0
    while offset < str.length
      substr = str[offset, str.length]
      match_data = substr.match(/\((\d+)x(\d+)\)/)
      if match_data.nil?
        length += str.length - offset
        offset = str.length
      else
        seg_len = match_data[1].to_i
        seg_cnt = match_data[2].to_i
        seg = str[offset + match_data.begin(0) + match_data[0].length, seg_len]
        length += match_data.begin(0) + decompress_v2_len(seg) * seg_cnt
        offset += match_data.begin(0) + match_data[0].length + seg_len
      end
    end
    length
  end
  # rubocop:enable all
end
