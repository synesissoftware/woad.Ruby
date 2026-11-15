#! /usr/bin/env ruby

# examples/print_status.rb


require 'woad'


puts "#{Woad::FG_GREEN}ok#{Woad::RESET}"
puts "#{Woad::FG_YELLOW}warn#{Woad::RESET}"
puts "#{Woad::FG_RED}error#{Woad::RESET}"
