#!/usr/bin/env ruby
#regular expression matching a string
#the string start with 'h' ends wiht 'n'

puts ARGV[0].scan(/^h.n$/).join
