#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day1"

puts Day1.new.call(File.read(File.join("data", "day1.txt")))
