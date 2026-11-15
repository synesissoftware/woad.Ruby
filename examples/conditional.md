# woad.Ruby - Example - **conditional**


## Summary

Prints a status word with an SGR sequence only when standard output supports colour.


## Source

```ruby

#! /usr/bin/env ruby

# examples/conditional.rb

require 'woad'

green = Woad.seq_for($stdout, Woad::FG_GREEN)
reset = Woad.seq_for($stdout, Woad::RESET)

puts "#{green}ok#{reset}"
```

`seq_for` returns the sequence when the writer supports colour, and `""` when it does not. A pipe, `TERM=dumb` under the automatic policy, and an inhibit policy all print `ok` with no escape sequences.


## Usage

When run, this produces the following output (colours omitted here):

```
ok
```


<!-- ########################### end of file ########################### -->
