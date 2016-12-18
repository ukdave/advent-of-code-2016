# frozen_string_literal: false
class Day3
  def read_valid_triangles_by_row file_path
    IO.foreach(file_path)
      .map {|line| line.split(" ").map(&:to_i) }
      .select {|t| valid_triangle? t }
  end

  def read_valid_triangles_by_col file_path
    IO.foreach(file_path)
      .map {|line| line.split(" ").map(&:to_i) }
      .each_slice(3)
      .flat_map {|lines|
        [[lines[0][0], lines[1][0], lines[2][0]],
         [lines[0][1], lines[1][1], lines[2][1]],
         [lines[0][2], lines[1][2], lines[2][2]]]
      }
      .select {|t| valid_triangle? t }
  end

  def valid_triangle? sides
    s = sides.sort
    s[0] + s[1] > s[2]
  end
end
