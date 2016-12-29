#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day5"

puts Day5.new.find_password(File.read(File.join("data", "day5.txt")).chomp)
