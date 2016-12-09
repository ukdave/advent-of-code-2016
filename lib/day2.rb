# frozen_string_literal: false
class Day2
  KEYPAD = [[1, 2, 3].freeze,
            [4, 5, 6].freeze,
            [7, 8, 9].freeze].freeze

  def call instructions
    instructions.each_with_object(pos: [0, 0], code: "") {|line, state|
      state[:pos] = get_new_position(line, state[:pos])
      state[:code] << KEYPAD[state[:pos][1]][state[:pos][0]].to_s
    }[:code]
  end

  private

  def get_new_position line, start_pos
    line.each_char.with_object(start_pos.dup) do |c, new_pos|
      new_pos[1] -= 1 if c == "U" && new_pos[1].positive?
      new_pos[1] += 1 if c == "D" && new_pos[1] < 2
      new_pos[0] -= 1 if c == "L" && new_pos[0].positive?
      new_pos[0] += 1 if c == "R" && new_pos[0] < 2
    end
  end
end
