#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day9"

puts Day9.new.decompress_v1_len(File.read(File.join("data", "day9.txt")).chomp)
puts Day9.new.decompress_v2_len(File.read(File.join("data", "day9.txt")).chomp)
