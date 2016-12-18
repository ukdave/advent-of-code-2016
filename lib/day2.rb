# frozen_string_literal: false
class Day2
  KEYPAD1 = [%w(1 2 3).freeze,
             %w(4 5 6).freeze,
             %w(7 8 9).freeze].freeze

  KEYPAD2 = [[nil, nil, "1", nil, nil].freeze,
             [nil, "2", "3", "4", nil].freeze,
             ["5", "6", "7", "8", "9"].freeze,
             [nil, "A", "B", "C", nil].freeze,
             [nil, nil, "D", nil, nil].freeze].freeze

  def calculate_code_keypad1 instructions
    calculate_code(instructions, KEYPAD1, [1, 1])
  end

  def calculate_code_keypad2 instructions
    calculate_code(instructions, KEYPAD2, [0, 2])
  end

  private

  def calculate_code instructions, keypad, start_pos
    instructions.each_with_object(pos: start_pos, code: "") {|line, state|
      state[:pos] = get_new_position(line, state[:pos], keypad)
      state[:code] << keypad[state[:pos][1]][state[:pos][0]]
    }[:code]
  end

  def get_new_position line, start_pos, keypad
    line.each_char.with_object(start_pos.dup) do |c, new_pos|
      new_pos[1] -= 1 if c == "U" && new_pos[1].positive?             && !keypad[new_pos[1] - 1][new_pos[0]].nil?
      new_pos[1] += 1 if c == "D" && new_pos[1] < (keypad.length - 1) && !keypad[new_pos[1] + 1][new_pos[0]].nil?
      new_pos[0] -= 1 if c == "L" && new_pos[0].positive?             && !keypad[new_pos[1]][new_pos[0] - 1].nil?
      new_pos[0] += 1 if c == "R" && new_pos[0] < (keypad.length - 1) && !keypad[new_pos[1]][new_pos[0] + 1].nil?
    end
  end
end
