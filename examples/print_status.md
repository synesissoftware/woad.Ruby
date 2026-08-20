# woad.Ruby - Example - **print_status**

## Summary

Prints sample status words using **woad** SGR foreground constants and **RESET**.

## Source

```ruby

#! /usr/bin/env ruby

# examples/print_status.rb

require 'woad'

puts "#{Woad::FG_GREEN}ok#{Woad::RESET}"
puts "#{Woad::FG_YELLOW}warn#{Woad::RESET}"
puts "#{Woad::FG_RED}error#{Woad::RESET}"
```

On a colour-capable terminal the words appear in green, yellow, and red, then the SGR state is reset.

## Usage

When run, this produces the following output (colours omitted here):

```
ok
warn
error
```


<!-- ########################### end of file ########################### -->
