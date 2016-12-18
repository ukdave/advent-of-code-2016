#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day2"

puts Day2.new.calculate_code_keypad1(File.readlines(File.join("data", "day2.txt")))
puts Day2.new.calculate_code_keypad2(File.readlines(File.join("data", "day2.txt")))
