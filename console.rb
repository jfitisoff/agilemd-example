#!/usr/bin/env ruby

require "pry"
require_relative "spec/spec_helper"

s = AgileMDSite.new
s.open
s.home_page

puts "\n\nPry session started. Use 's' to access the site object.\n\n"

binding.pry
