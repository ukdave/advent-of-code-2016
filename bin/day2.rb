#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day2"

puts Day2.new.call(File.readlines(File.join("data", "day2.txt")))
