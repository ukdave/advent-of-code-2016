#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day10"

day10 = Day10.new

# part 1
day10.watch_bot_values([61, 17]) do |bot| puts bot[:num] end
day10.process_commands(File.readlines(File.join("data", "day10.txt")))

# part 2
puts [0, 1, 2].reduce(1) {|acc, elem| acc * day10.get_output(elem)[:values].first }
