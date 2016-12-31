# frozen_string_literal: false
class Day8
  def initialize w = 50, h = 6
    @screen = Array.new(h) { Array.new(w) { "." } }
  end

  def process_commands cmds
    cmds.each do |cmd|
      process_command(cmd)
      # puts "#{cmd}#{self}\n\n"
    end
    self
  end

  # rubocop:disable AbcSize, LineLength
  def process_command cmd
    draw_rect(*cmd.match(/rect (\d+)x(\d+)/).captures.map(&:to_i)) if cmd =~ /rect \d+x\d+/
    rotate_column(*cmd.match(/rotate column x=(\d+) by (\d+)/).captures.map(&:to_i)) if cmd =~ /rotate column x=\d+ by \d+/
    rotate_row(*cmd.match(/rotate row y=(\d+) by (\d+)/).captures.map(&:to_i)) if cmd =~ /rotate row y=\d+ by \d+/
    self
  end
  # rubocop:enable all

  # rubocop:disable MethodLength
  def draw_rect w, h
    (0...h).each do |y|
      (0...w).each do |x|
        @screen[y][x] = "#"
      end
    end
    self
  end
  # rubocop:enable all

  def rotate_column col_num, count
    col = @screen.each_with_object([]) do |row, c| c << row[col_num] end
    col.rotate!(-count)
    @screen.each_with_index do |row, i| row[col_num] = col[i] end
    self
  end

  def rotate_row row_num, count
    @screen[row_num].rotate!(-count)
    self
  end

  def count_on
    @screen.reduce(0) do |total, row|
      total + row.reduce(0) {|row_count, pixel|
        pixel == "#" ? row_count + 1 : row_count
      }
    end
  end

  def to_s
    @screen.map(&:join).join("\n")
  end
end
