#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/day7"

puts Day7.new.select_tls_addresses(File.readlines(File.join("data", "day7.txt"))).length
