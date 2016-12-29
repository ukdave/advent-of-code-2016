#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day6"

puts Day6.new.decode(File.readlines(File.join("data", "day6.txt")))
