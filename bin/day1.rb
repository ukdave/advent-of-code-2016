#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day1"

puts Day1.new.shortest_path(File.read(File.join("data", "day1.txt")))
puts Day1.new.first_intersection_dist(File.read(File.join("data", "day1.txt")))
