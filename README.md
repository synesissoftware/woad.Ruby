# woad.Ruby <!-- omit in toc -->

Minimal ANSI terminal colour codes, for Ruby

![Language](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Gem Version](https://badge.fury.io/rb/woad.svg)](https://badge.fury.io/rb/woad)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/woad.Ruby)](https://github.com/synesissoftware/woad.Ruby/commits/master)
[![Ruby](https://github.com/synesissoftware/woad.Ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/synesissoftware/woad.Ruby/actions/workflows/ruby.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Components](#components)
- [Examples](#examples)
- [Project Information](#project-information)
  - [Where to get help](#where-to-get-help)
  - [Contribution guidelines](#contribution-guidelines)
  - [Dependencies](#dependencies)
    - [Efferent (fan-out)](#efferent-fan-out)
      - [Runtime Dependencies (aka "Normal Dependencies")](#runtime-dependencies-aka-normal-dependencies)
      - [Development Dependencies](#development-dependencies)
    - [Afferent (fan-in)](#afferent-fan-in)
      - [Runtime dependents](#runtime-dependents)
      - [Development dependents](#development-dependents)
  - [Related projects](#related-projects)
  - [License](#license)


## Introduction

**woad** provides the smallest useful set of fixed ANSI SGR colour sequences for library authors. It is not a console or TUI framework.

**woad.Ruby** is the **Ruby** implementation. It supports **Ruby 2.0+**.

It has **no dependencies** on any other non-standard library.


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


## Examples

Examples are provided in the ```examples``` directory, along with a markdown description for each. A detailed list TOC of them is provided in [EXAMPLES.md](./EXAMPLES.md).


## Project Information


### Where to get help

[GitHub Page](https://github.com/synesissoftware/woad.Ruby "GitHub Page")


### Contribution guidelines

Defect reports, feature requests, and pull requests are welcome on https://github.com/synesissoftware/woad.Ruby.


### Dependencies


#### Efferent (fan-out)

Libraries upon which **woad.Ruby** depends:


##### Runtime Dependencies (aka "Normal Dependencies")

* \<none>;


##### Development Dependencies

* [**rake**](https://rubygems.org/gems/rake);
* [**test-unit**](https://rubygems.org/gems/test-unit);


#### Afferent (fan-in)

Projects that depend on **woad.Ruby**:


##### Runtime dependents

* \<none>;


##### Development dependents

* \<none>;


### Related projects

* [**woad**](https://github.com/synesissoftware/woad/) (**C**);
* [**woad.Python**](https://github.com/synesissoftware/woad.Python/);
* [**woad.Rust**](https://github.com/synesissoftware/woad.Rust/);


### License

**woad.Ruby** is released under the 3-clause BSD license. See [LICENSE](./LICENSE) for details.


<!-- ########################### end of file ########################### -->
