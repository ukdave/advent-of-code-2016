# frozen_string_literal: true
class Day1
  def call instructions
    position = {coords: [0, 0], angle: 0}
    instructions.split(",").each_with_object(position) do |step, pos|
      process_step(pos, step)
    end
    position[:coords][0].abs + position[:coords][1].abs
  end

  private

  def process_step pos, step
    step_dir, step_dist = /(L|R)([0-9]+)/.match(step.strip).captures
    pos[:angle] = calc_new_angle(pos[:angle], step_dir == "L" ? -90 : 90)
    pos[:coords] = calc_new_coords(pos[:coords], pos[:angle], step_dist.to_i)
  end

  def calc_new_angle angle, adjustment
    (angle + adjustment) % 360
  end

  def calc_new_coords coords, angle, dist
    x, y = coords
    x += dist * (angle.zero? ? 1 : -1) if angle.zero? || angle == 180
    y += dist * (angle == 90 ? 1 : -1) if angle == 90 || angle == 270
    [x, y]
  end
end
