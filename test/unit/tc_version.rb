#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')


require 'woad/version'

require 'test/unit'


class Test_version < Test::Unit::TestCase

  def test_has_VERSION

    assert defined? Woad::VERSION
  end

  def test_has_VERSION_MAJOR

    assert defined? Woad::VERSION_MAJOR
  end

  def test_has_VERSION_MINOR

    assert defined? Woad::VERSION_MINOR
  end

  def test_has_VERSION_REVISION

    assert defined? Woad::VERSION_REVISION
  end

  def test_VERSION_has_consistent_format

    assert_equal Woad::VERSION.split('.')[0..2].join('.'), "#{Woad::VERSION_MAJOR}.#{Woad::VERSION_MINOR}.#{Woad::VERSION_REVISION}"
  end
end
