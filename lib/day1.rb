# frozen_string_literal: true
class Day1
  def shortest_path instructions
    position = {coords: [0, 0], angle: 0}
    instructions.split(",").each do |step|
      process_step(position, step)
    end
    position[:coords][0].abs + position[:coords][1].abs
  end

  # rubocop:disable MethodLength
  def first_intersection_dist instructions
    position = {coords: [0, 0], angle: 0}
    history = [[0, 0]]
    instructions.split(",").each do |step|
      process_step(position, step)
      history << position[:coords]
      intersection = check_intersection(history[0..-3], history[-2..-1])
      return intersection[0].abs + intersection[1].abs unless intersection.nil?
    end
    nil
  end
  # rubocop:enable all

  # rubocop:disable AbcSize, CyclomaticComplexity, PerceivedComplexity, ParallelAssignment, MethodLength
  def check_intersection history, line
    x1, y1, x2, y2 = [line[0][0], line[0][1], line[1][0], line[1][1]]
    history.each_cons(2) do |l|
      x3, y3, x4, y4 = [l[0][0], l[0][1], l[1][0], l[1][1]]
      x_intercept = x1 if x1 == x2 && x3 != x4 && x1.between?(*[x3, x4].sort)
      x_intercept = x3 if x3 == x4 && x1 != x2 && x3.between?(*[x1, x2].sort)
      y_intercept = y1 if y1 == y2 && y3 != y4 && y1.between?(*[y3, y4].sort)
      y_intercept = y3 if y3 == y4 && y1 != y2 && y3.between?(*[y1, y2].sort)
      return [x_intercept, y_intercept] unless x_intercept.nil? || y_intercept.nil?
    end
  end
  # rubocop:enable all

  private

  def process_step pos, step
    step_dir, step_dist = /(L|R)([0-9]+)/.match(step.strip).captures
    pos[:angle] = calc_new_angle(pos[:angle], step_dir == "L" ? -90 : 90)
    pos[:coords] = calc_new_coords(pos[:coords], pos[:angle], step_dist.to_i)
  end

  def calc_new_angle angle, adjustment
    (angle + adjustment) % 360
  end

  # rubocop:disable CyclomaticComplexity
  def calc_new_coords coords, angle, dist
    x, y = coords
    x += dist * (angle.zero? ? 1 : -1) if angle.zero? || angle == 180
    y += dist * (angle == 90 ? 1 : -1) if angle == 90 || angle == 270
    [x, y]
  end
  # rubocop:enable all
end
