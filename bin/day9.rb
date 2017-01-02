#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day9"

puts Day9.new.decompress(File.read(File.join("data", "day9.txt")).chomp).length
