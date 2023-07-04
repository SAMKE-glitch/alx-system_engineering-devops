#!/usr/bin/env ruby
# A regular expression that matches phone numbers
puts ARGV[0].scan(/^[0-9]{10}$/).join
