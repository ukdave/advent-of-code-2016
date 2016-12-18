#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day3"

puts Day3.new.read_valid_triangles_by_row(File.join("data", "day3.txt")).length
puts Day3.new.read_valid_triangles_by_col(File.join("data", "day3.txt")).length
