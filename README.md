# woad.Ruby <!-- omit in toc -->

Minimal ANSI terminal colour codes, for Ruby

![Language](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Gem Version](https://badge.fury.io/rb/woad.svg)](https://badge.fury.io/rb/woad)
[![GitHub release](https://img.shields.io/github/v/release/synesissoftware/woad.Ruby.svg)](https://github.com/synesissoftware/woad.Ruby/releases/latest)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/woad.Ruby)](https://github.com/synesissoftware/woad.Ruby/commits/master)
[![Ruby](https://github.com/synesissoftware/woad.Ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/synesissoftware/woad.Ruby/actions/workflows/ruby.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Components](#components)
- [Project Information](#project-information)
  - [Where to get help](#where-to-get-help)
  - [Contribution guidelines](#contribution-guidelines)
  - [Dependencies](#dependencies)
    - [Development Dependencies](#development-dependencies)
  - [Related projects](#related-projects)
  - [License](#license)


## Introduction

**woad** provides the smallest useful set of fixed ANSI SGR colour sequences for library authors. It is not a console or TUI framework.

**woad.Ruby** is the **Ruby** implementation. It supports **Ruby 2.0** through **3.x**.


## Installation

Install via **gem** as in:

```
gem install woad
```

or add it to your `Gemfile`.

Use via **require**, as in:

```Ruby
require 'woad'

puts "#{Woad::FG_GREEN}ok#{Woad::RESET}"
```


## Components

**woad.Ruby** ships SGR string constants (`RESET`, `FG_*`, `BG_*`, including bright variants). TTY/stream gating and Windows virtual-terminal opt-in are not implemented yet.


## Project Information


### Where to get help

[GitHub Page](https://github.com/synesissoftware/woad.Ruby "GitHub Page")


### Contribution guidelines

Defect reports, feature requests, and pull requests are welcome on https://github.com/synesissoftware/woad.Ruby.


### Dependencies

* \<none>


#### Development Dependencies

* [**rake**](https://github.com/ruby/rake)
* [**test-unit**](https://github.com/test-unit/test-unit)


### Related projects

* [**woad**](https://github.com/synesissoftware/woad/)
* [**woad.Python**](https://github.com/synesissoftware/woad.Python/)
* [**woad.Rust**](https://github.com/synesissoftware/woad.Rust/)


### License

**woad.Ruby** is released under the 3-clause BSD license. See [LICENSE](./LICENSE) for details.


<!-- ########################### end of file ########################### -->
