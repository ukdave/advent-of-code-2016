#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day4"

puts Day4.new.sum_valid_sector_ids(File.readlines(File.join("data", "day4.txt")))
