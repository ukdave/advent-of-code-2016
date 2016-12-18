#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day3"

triangles = IO.foreach(File.join("data", "day3.txt")).with_object([]) {|line, a| a << line.split(" ").map(&:to_i) }
valid_triangles = triangles.select {|t| Day3.valid_triangle? t }
puts valid_triangles.length
