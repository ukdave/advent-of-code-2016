#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day6"

puts Day6.new.decode(File.readlines(File.join("data", "day6.txt")))
puts Day6.new.decode2(File.readlines(File.join("data", "day6.txt")))
