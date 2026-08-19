# ######################################################################## #
# File:     woad.gemspec
#
# Purpose:  Gemspec for woad.Ruby library
#
# Created:  15th August 2026
# Updated:  19th August 2026
#
# ######################################################################## #


$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'woad/version'


Gem::Specification.new do |spec|

  spec.name         = 'woad'
  spec.summary      = 'Minimal ANSI terminal colour codes, for Ruby'
  spec.version      = Woad::VERSION
  spec.description  = <<END_DESC
Minimal ANSI terminal colour codes, for Ruby.

woad.Ruby is the Ruby implementation of the woad family of libraries.
END_DESC

  spec.authors      = [
    'Matt Wilson',
  ]
  spec.email        = [
    'matthew@synesis.com.au',
  ]
  spec.homepage     = 'https://github.com/synesissoftware/woad.Ruby'
  spec.license      = 'BSD-3-Clause'

  spec.required_ruby_version = [ '>= 2.0' ]

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/synesissoftware/woad.Ruby/issues',
    'changelog_uri' => 'https://github.com/synesissoftware/woad.Ruby/blob/master/CHANGES.md',
    'homepage_uri' => 'https://github.com/synesissoftware/woad.Ruby',
    'source_code_uri' => 'https://github.com/synesissoftware/woad.Ruby',
  }

  spec.files = Dir[
    'Rakefile',
    '{bin,examples,lib,man,spec,test}/**/*',
    'AUTHORS*',
    'CHANGES*',
    'CONTRIBUTING*',
    'EXAMPLES*',
    'FAQ*',
    'INSTALL*',
    'LICENSE*',
    'NEWS*',
    'README*',
    'SECURITY*',
    'TODO*',
  ] & `git ls-files -z`.split("\0")
  spec.files -= [
    '.ruby-version',
    'Gemfile.lock',
  ]
end


# ############################## end of file ############################# #
