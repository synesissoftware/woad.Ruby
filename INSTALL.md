# woad.Ruby - Installation and Use <!-- omit in toc -->


## Table of Contents <!-- omit in toc -->

- [Install the gem](#install-the-gem)
- [From a source checkout](#from-a-source-checkout)
- [Using the library](#using-the-library)


## Install the gem

```
gem install woad
```

or add to a **Gemfile**:

```Ruby
gem 'woad'
```

then `bundle install`.


## From a source checkout

```
bundle install
bundle exec rake test
```


## Using the library

```Ruby
require 'woad'

puts "#{Woad::FG_GREEN}ok#{Woad::RESET}"
```


<!-- ########################### end of file ########################### -->
