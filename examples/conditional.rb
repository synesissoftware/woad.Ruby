#! /usr/bin/env ruby

# examples/conditional.rb


require 'woad'


green = Woad.seq_for($stdout, Woad::FG_GREEN)
reset = Woad.seq_for($stdout, Woad::RESET)

puts "#{green}ok#{reset}"
