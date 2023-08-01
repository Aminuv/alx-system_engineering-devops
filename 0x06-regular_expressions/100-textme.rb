#!/usr/bin/env ruby
#script run statics on TextMe APP
#The sender phone numben
#The recever phone number or name 
#The flags

puts ARGV[0].scan(/\[(?:from:|to:|flags:)(.*?)\]/).join(",")
